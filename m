Content-Type: multipart/mixed; boundary="===============0726056658905975864=="
MIME-Version: 1.0
From: Tom Zhao <tzhao@solarflare.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next] sfc: complete the next packet when we receive a timestamp
Date: Mon, 24 Feb 2020 09:41:10 +0000
Message-ID: <1582537270688.35761@solarflare.com>
In-Reply-To: <202002222146.hHWMuzDx%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0726056658905975864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

Sorry I think I applied this to a stale repo. I will respin this when I get=
 time.
________________________________________
From: kbuild test robot <lkp@intel.com>
Sent: 22 February 2020 13:36
To: Tom Zhao
Cc: kbuild-all(a)lists.01.org; David Miller; Net Dev; linux-net-drivers
Subject: Re: [PATCH net-next] sfc: complete the next packet when we receive=
 a timestamp

Hi Tom,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.5]
[cannot apply to net-next/master linus/master sparc-next/master ipvs/master=
 v5.6-rc2 v5.6-rc1 next-20200221]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Tom-Zhao/sfc-complete-the-=
next-packet-when-we-receive-a-timestamp/20200221-083821
base:    d5226fa6dbae0569ee43ecfc08bdcd6770fc4755
config: arm64-allyesconfig (attached as .config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm64

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/ethernet/sfc/tx.c: In function 'efx_xmit_done_check_empty':
>> drivers/net/ethernet/sfc/tx.c:845:31: error: implicit declaration of fun=
ction 'ACCESS_ONCE'; did you mean 'READ_ONCE'? [-Werror=3Dimplicit-function=
-declaration]
      tx_queue->old_write_count =3D ACCESS_ONCE(tx_queue->write_count);
                                  ^~~~~~~~~~~
                                  READ_ONCE
   drivers/net/ethernet/sfc/tx.c: In function 'efx_xmit_done_single':
>> drivers/net/ethernet/sfc/tx.c:905:19: error: 'struct efx_nic' has no mem=
ber named 'errors'
       atomic_inc(&efx->errors.spurious_tx);
                      ^~
   cc1: some warnings being treated as errors

vim +845 drivers/net/ethernet/sfc/tx.c

   841
   842  static void efx_xmit_done_check_empty(struct efx_tx_queue *tx_queue)
   843  {
   844          if ((int)(tx_queue->read_count - tx_queue->old_write_count)=
 >=3D 0) {
 > 845                  tx_queue->old_write_count =3D ACCESS_ONCE(tx_queue-=
>write_count);
   846                  if (tx_queue->read_count =3D=3D tx_queue->old_write=
_count) {
   847                          smp_mb();
   848                          tx_queue->empty_read_count =3D
   849                                  tx_queue->read_count | EFX_EMPTY_CO=
UNT_VALID;
   850                  }
   851          }
   852  }
   853
   854  void efx_xmit_done(struct efx_tx_queue *tx_queue, unsigned int inde=
x)
   855  {
   856          unsigned fill_level;
   857          struct efx_nic *efx =3D tx_queue->efx;
   858          struct efx_tx_queue *txq2;
   859          unsigned int pkts_compl =3D 0, bytes_compl =3D 0;
   860
   861          EFX_WARN_ON_ONCE_PARANOID(index > tx_queue->ptr_mask);
   862
   863          efx_dequeue_buffers(tx_queue, index, &pkts_compl, &bytes_co=
mpl);
   864          tx_queue->pkts_compl +=3D pkts_compl;
   865          tx_queue->bytes_compl +=3D bytes_compl;
   866
   867          if (pkts_compl > 1)
   868                  ++tx_queue->merge_events;
   869
   870          /* See if we need to restart the netif queue.  This memory
   871           * barrier ensures that we write read_count (inside
   872           * efx_dequeue_buffers()) before reading the queue status.
   873           */
   874          smp_mb();
   875          if (unlikely(netif_tx_queue_stopped(tx_queue->core_txq)) &&
   876              likely(efx->port_enabled) &&
   877              likely(netif_device_present(efx->net_dev))) {
   878                  txq2 =3D efx_tx_queue_partner(tx_queue);
   879                  fill_level =3D max(tx_queue->insert_count - tx_queu=
e->read_count,
   880                                   txq2->insert_count - txq2->read_co=
unt);
   881                  if (fill_level <=3D efx->txq_wake_thresh)
   882                          netif_tx_wake_queue(tx_queue->core_txq);
   883          }
   884
   885          efx_xmit_done_check_empty(tx_queue);
   886  }
   887
   888  void efx_xmit_done_single(struct efx_tx_queue *tx_queue)
   889  {
   890          unsigned int pkts_compl =3D 0, bytes_compl =3D 0;
   891          unsigned int read_ptr;
   892          bool finished =3D false;
   893
   894          read_ptr =3D tx_queue->read_count & tx_queue->ptr_mask;
   895
   896          while (!finished) {
   897                  struct efx_tx_buffer *buffer =3D &tx_queue->buffer[=
read_ptr];
   898
   899                  if (!efx_tx_buffer_in_use(buffer)) {
   900                          struct efx_nic *efx =3D tx_queue->efx;
   901
   902                          netif_err(efx, hw, efx->net_dev,
   903                                    "TX queue %d spurious single TX c=
ompletion\n",
   904                                    tx_queue->queue);
 > 905                          atomic_inc(&efx->errors.spurious_tx);
   906                          efx_schedule_reset(efx, RESET_TYPE_TX_SKIP);
   907                          return;
   908                  }
   909
   910                  /* Need to check the flag before dequeueing. */
   911                  if (buffer->flags & EFX_TX_BUF_SKB)
   912                          finished =3D true;
   913                  efx_dequeue_buffer(tx_queue, buffer, &pkts_compl, &=
bytes_compl);
   914
   915                  ++tx_queue->read_count;
   916                  read_ptr =3D tx_queue->read_count & tx_queue->ptr_m=
ask;
   917          }
   918
   919          tx_queue->pkts_compl +=3D pkts_compl;
   920          tx_queue->bytes_compl +=3D bytes_compl;
   921
   922          EFX_WARN_ON_PARANOID(pkts_compl !=3D 1);
   923
   924          efx_xmit_done_check_empty(tx_queue);
   925  }
   926

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0726056658905975864==--

