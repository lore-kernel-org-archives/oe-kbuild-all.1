Content-Type: multipart/mixed; boundary="===============5173719776689419580=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [xhci:for-usb-next 24/26] drivers/usb/host/xhci-ring.c:762:60: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int')
Date: Fri, 29 Jan 2021 10:25:17 +0800
Message-ID: <202101291015.6Sxq7wOW-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5173719776689419580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for=
-usb-next
head:   1459194e2d74bfcad77992efdeeec568933df64d
commit: 07677197e939dd5ec8470d1d34f8644bb8306af4 [24/26] xhci: introduce a =
new move_dequeue_past_td() function to replace old code.
config: riscv-randconfig-r032-20210128 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 275c6a=
f7d7f1ed63a03d05b4484413e447133269)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/c=
ommit/?id=3D07677197e939dd5ec8470d1d34f8644bb8306af4
        git remote add xhci https://git.kernel.org/pub/scm/linux/kernel/git=
/mnyman/xhci.git
        git fetch --no-tags xhci for-usb-next
        git checkout 07677197e939dd5ec8470d1d34f8644bb8306af4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-ring.c:762:60: warning: format specifies type 'uns=
igned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int'=
) [-Wformat]
                   xhci_warn(xhci, "WARN Can't submit Set TR Deq 0x%llx\n",=
 addr);
                                                                   ~~~~    =
 ^~~~
                                                                   %x
   drivers/usb/host/xhci.h:1965:57: note: expanded from macro 'xhci_warn'
           dev_warn(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
                                                         ~~~      ^~~~
   include/linux/dev_printk.h:114:33: note: expanded from macro 'dev_warn'
           _dev_warn(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:770:68: warning: format specifies type 'uns=
igned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int'=
) [-Wformat]
                   xhci_warn(xhci, "WARN Fail to allocate Set TR Deq cmd 0x=
%llx\n", addr);
                                                                           =
~~~~     ^~~~
                                                                           =
%x
   drivers/usb/host/xhci.h:1965:57: note: expanded from macro 'xhci_warn'
           dev_warn(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
                                                         ~~~      ^~~~
   include/linux/dev_printk.h:114:33: note: expanded from macro 'dev_warn'
           _dev_warn(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:671:5: warning: no previous prototype for f=
unction 'xhci_move_dequeue_past_td' [-Wmissing-prototypes]
   int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
       ^
   drivers/usb/host/xhci-ring.c:671:1: note: declare 'static' if the functi=
on is not intended to be used outside of this translation unit
   int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
   ^
   static =

   3 warnings generated.


vim +762 drivers/usb/host/xhci-ring.c

   670	=

   671	int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
   672				      unsigned int slot_id, unsigned int ep_index,
   673				      unsigned int stream_id, struct xhci_td *td)
   674	{
   675		struct xhci_virt_device *dev =3D xhci->devs[slot_id];
   676		struct xhci_virt_ep *ep =3D &dev->eps[ep_index];
   677		struct xhci_ring *ep_ring;
   678		struct xhci_command *cmd;
   679		struct xhci_segment *new_seg;
   680		union xhci_trb *new_deq;
   681		int new_cycle;
   682		dma_addr_t addr;
   683		u64 hw_dequeue;
   684		bool cycle_found =3D false;
   685		bool td_last_trb_found =3D false;
   686		u32 trb_sct =3D 0;
   687		int ret;
   688	=

   689		ep_ring =3D xhci_triad_to_transfer_ring(xhci, slot_id,
   690				ep_index, stream_id);
   691		if (!ep_ring) {
   692			xhci_warn(xhci, "WARN can't find new dequeue, invalid stream ID %u=
\n",
   693				  stream_id);
   694			return -ENODEV;
   695		}
   696		/*
   697		 * A cancelled TD can complete with a stall if HW cached the trb.
   698		 * In this case driver can't find td, but if the ring is empty we
   699		 * can move the dequeue pointer to the current enqueue position.
   700		 * FIXMA MATTU is this still the case?
   701		 */
   702		if (!td) {
   703			if (list_empty(&ep_ring->td_list)) {
   704				new_seg =3D ep_ring->enq_seg;
   705				new_deq =3D ep_ring->enqueue;
   706				new_cycle =3D ep_ring->cycle_state;
   707				xhci_dbg(xhci, "ep ring empty, Set new dequeue =3D enqueue");
   708				goto deq_found;
   709			} else {
   710				xhci_warn(xhci, "Can't find new dequeue state, missing td\n");
   711				return -EINVAL;
   712			}
   713		}
   714	=

   715		hw_dequeue =3D xhci_get_hw_deq(xhci, dev, ep_index, stream_id);
   716		new_seg =3D ep_ring->deq_seg;
   717		new_deq =3D ep_ring->dequeue;
   718		new_cycle =3D hw_dequeue & 0x1;
   719	=

   720		/*
   721		 * We want to find the pointer, segment and cycle state of the new =
trb
   722		 * (the one after current TD's last_trb). We know the cycle state at
   723		 * hw_dequeue, so walk the ring until both hw_dequeue and last_trb =
are
   724		 * found.
   725		 */
   726		do {
   727			if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_deq)
   728			    =3D=3D (dma_addr_t)(hw_dequeue & ~0xf)) {
   729				cycle_found =3D true;
   730				if (td_last_trb_found)
   731					break;
   732			}
   733			if (new_deq =3D=3D td->last_trb)
   734				td_last_trb_found =3D true;
   735	=

   736			if (cycle_found && trb_is_link(new_deq) &&
   737			    link_trb_toggles_cycle(new_deq))
   738				new_cycle ^=3D 0x1;
   739	=

   740			next_trb(xhci, ep_ring, &new_seg, &new_deq);
   741	=

   742			/* Search wrapped around, bail out */
   743			if (new_deq =3D=3D ep->ring->dequeue) {
   744				xhci_err(xhci, "Error: Failed finding new dequeue state\n");
   745				return -EINVAL;
   746			}
   747	=

   748		} while (!cycle_found || !td_last_trb_found);
   749	=

   750	deq_found:
   751	=

   752		/* Don't update the ring cycle state for the producer (us). */
   753		addr =3D xhci_trb_virt_to_dma(new_seg, new_deq);
   754		if (addr =3D=3D 0) {
   755			xhci_warn(xhci, "WARN Cannot find dma of new dequeue ptr\n");
   756			xhci_warn(xhci, "deq seg =3D %p, deq ptr =3D %p\n", new_seg, new_d=
eq);
   757			return -EINVAL;
   758		}
   759	=

   760		/* MATTU fixme do we want this PENDING flag at all?*/
   761		if ((ep->ep_state & SET_DEQ_PENDING)) {
 > 762			xhci_warn(xhci, "WARN Can't submit Set TR Deq 0x%llx\n", addr);
   763			xhci_warn(xhci, "Another Set TR Deq command is pending.\n");
   764			return -EBUSY;  //MATTU FIXME
   765		}
   766	=

   767		/* This function gets called from contexts where it cannot sleep */
   768		cmd =3D xhci_alloc_command(xhci, false, GFP_ATOMIC);
   769		if (!cmd) {
   770			xhci_warn(xhci, "WARN Fail to allocate Set TR Deq cmd 0x%llx\n", a=
ddr);
   771			return -ENOMEM;
   772		}
   773	=

   774		if (stream_id)
   775			trb_sct =3D SCT_FOR_TRB(SCT_PRI_TR);
   776		ret =3D queue_command(xhci, cmd,
   777			lower_32_bits(addr) | trb_sct | new_cycle,
   778			upper_32_bits(addr),
   779			STREAM_ID_FOR_TRB(stream_id), SLOT_ID_FOR_TRB(slot_id) |
   780			EP_ID_FOR_TRB(ep_index) | TRB_TYPE(TRB_SET_DEQ), false);
   781		if (ret < 0) {
   782			xhci_free_command(xhci, cmd);
   783			return ret;
   784		}
   785		ep->queued_deq_seg =3D new_seg;
   786		ep->queued_deq_ptr =3D new_deq;
   787	=

   788		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
   789			       "Set TR Deq ptr 0x%llx, cycle %u\n", addr, new_cycle);
   790	=

   791		/* Stop the TD queueing code from ringing the doorbell until
   792		 * this command completes.  The HC won't set the dequeue pointer
   793		 * if the ring is running, and ringing the doorbell starts the
   794		 * ring running.
   795		 */
   796		ep->ep_state |=3D SET_DEQ_PENDING;
   797		xhci_ring_cmd_db(xhci);
   798		return 0;
   799	}
   800	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5173719776689419580==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5173719776689419580==--

