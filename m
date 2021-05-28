Content-Type: multipart/mixed; boundary="===============7791261033482662116=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v6 06/27] nvme-tcp-offload: Add controller level error recovery implementation
Date: Fri, 28 May 2021 14:31:21 +0800
Message-ID: <202105281406.dbjhWLDQ-lkp@intel.com>
In-Reply-To: <20210527235902.2185-7-smalin@marvell.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7791261033482662116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Shai,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v5.13-rc3 next-20210527]
[cannot apply to ipvs/master sparc-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Shai-Malin/NVMeTCP-Offload=
-ULP-and-QEDN-Device-Driver/20210528-080853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
97e5bf604b7a0d6e1b3e00fe31d5fd4b9bffeaae
config: arm-mps2_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/965f409242223439aadb3ec4c=
7d61b947160788e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Shai-Malin/NVMeTCP-Offload-ULP-and=
-QEDN-Device-Driver/20210528-080853
        git checkout 965f409242223439aadb3ec4c7d61b947160788e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darm =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_keep_a=
live_end_io':
   core.c:(.text+0x250): undefined reference to `blk_mq_free_request'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_set_qu=
eue_limits':
   core.c:(.text+0x538): undefined reference to `blk_queue_max_hw_sectors'
   arm-linux-gnueabi-ld: core.c:(.text+0x54a): undefined reference to `blk_=
queue_max_segments'
   arm-linux-gnueabi-ld: core.c:(.text+0x554): undefined reference to `blk_=
queue_virt_boundary'
   arm-linux-gnueabi-ld: core.c:(.text+0x55c): undefined reference to `blk_=
queue_dma_alignment'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_cancel=
_request':
   core.c:(.text+0x73a): undefined reference to `blk_mq_complete_request'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_cancel=
_tagset':
   core.c:(.text+0x1304): undefined reference to `blk_mq_tagset_busy_iter'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_cancel=
_admin_tagset':
   core.c:(.text+0x1324): undefined reference to `blk_mq_tagset_busy_iter'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_free_n=
s':
   core.c:(.text+0x1504): undefined reference to `put_disk'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_alloc_=
request':
   core.c:(.text+0x1562): undefined reference to `blk_mq_alloc_request'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_comple=
te_rq':
   core.c:(.text+0x170c): undefined reference to `blk_mq_requeue_request'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `__nvme_subm=
it_sync_cmd':
   core.c:(.text+0x18d4): undefined reference to `blk_mq_alloc_request_hctx'
   arm-linux-gnueabi-ld: core.c:(.text+0x1902): undefined reference to `blk=
_execute_rq'
   arm-linux-gnueabi-ld: core.c:(.text+0x191c): undefined reference to `blk=
_rq_map_kern'
   arm-linux-gnueabi-ld: core.c:(.text+0x1928): undefined reference to `blk=
_mq_free_request'
   arm-linux-gnueabi-ld: core.c:(.text+0x196c): undefined reference to `blk=
_execute_rq_nowait'
   arm-linux-gnueabi-ld: core.c:(.text+0x19b8): undefined reference to `blk=
_poll'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_update=
_ns_info':
   core.c:(.text+0x1bce): undefined reference to `blk_mq_freeze_queue'
   arm-linux-gnueabi-ld: core.c:(.text+0x1c50): undefined reference to `blk=
_queue_chunk_sectors'
   arm-linux-gnueabi-ld: core.c:(.text+0x1ca6): undefined reference to `blk=
_queue_flag_test_and_set'
   arm-linux-gnueabi-ld: core.c:(.text+0x1cb6): undefined reference to `blk=
_queue_max_discard_sectors'
   arm-linux-gnueabi-ld: core.c:(.text+0x1cc0): undefined reference to `blk=
_queue_max_discard_segments'
   arm-linux-gnueabi-ld: core.c:(.text+0x1cd4): undefined reference to `blk=
_queue_max_write_zeroes_sectors'
   arm-linux-gnueabi-ld: core.c:(.text+0x1ce0): undefined reference to `blk=
_mq_unfreeze_queue'
   arm-linux-gnueabi-ld: core.c:(.text+0x1de0): undefined reference to `blk=
_queue_logical_block_size'
   arm-linux-gnueabi-ld: core.c:(.text+0x1df2): undefined reference to `blk=
_queue_physical_block_size'
   arm-linux-gnueabi-ld: core.c:(.text+0x1dfc): undefined reference to `blk=
_queue_io_min'
   arm-linux-gnueabi-ld: core.c:(.text+0x1e06): undefined reference to `blk=
_queue_io_opt'
   arm-linux-gnueabi-ld: core.c:(.text+0x1e24): undefined reference to `set=
_capacity_and_notify'
   arm-linux-gnueabi-ld: core.c:(.text+0x1e4e): undefined reference to `blk=
_queue_flag_clear'
   arm-linux-gnueabi-ld: core.c:(.text+0x1e5c): undefined reference to `blk=
_queue_max_write_zeroes_sectors'
   arm-linux-gnueabi-ld: core.c:(.text+0x1e72): undefined reference to `set=
_disk_ro'
   arm-linux-gnueabi-ld: core.c:(.text+0x1e96): undefined reference to `blk=
_mq_unfreeze_queue'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_ns_rem=
ove':
   core.c:(.text+0x2dec): undefined reference to `set_capacity'
   arm-linux-gnueabi-ld: core.c:(.text+0x2e54): undefined reference to `del=
_gendisk'
   arm-linux-gnueabi-ld: core.c:(.text+0x2e5a): undefined reference to `blk=
_cleanup_queue'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_alloc_=
ns':
   core.c:(.text+0x2fb2): undefined reference to `blk_mq_init_queue'
   arm-linux-gnueabi-ld: core.c:(.text+0x2fce): undefined reference to `blk=
_queue_flag_set'
   arm-linux-gnueabi-ld: core.c:(.text+0x2fd6): undefined reference to `blk=
_queue_flag_set'
   arm-linux-gnueabi-ld: core.c:(.text+0x2fe6): undefined reference to `blk=
_queue_flag_set'
   arm-linux-gnueabi-ld: core.c:(.text+0x3090): undefined reference to `blk=
_cleanup_queue'
   arm-linux-gnueabi-ld: core.c:(.text+0x3150): undefined reference to `blk=
_status_to_errno'
   arm-linux-gnueabi-ld: core.c:(.text+0x3228): undefined reference to `__a=
lloc_disk_node'
   arm-linux-gnueabi-ld: core.c:(.text+0x3262): undefined reference to `put=
_disk'
   arm-linux-gnueabi-ld: core.c:(.text+0x32fa): undefined reference to `dev=
ice_add_disk'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_kill_q=
ueues':
   core.c:(.text+0x39d4): undefined reference to `blk_mq_unquiesce_queue'
   arm-linux-gnueabi-ld: core.c:(.text+0x3a02): undefined reference to `blk=
_set_queue_dying'
   arm-linux-gnueabi-ld: core.c:(.text+0x3a08): undefined reference to `blk=
_mq_unquiesce_queue'
   arm-linux-gnueabi-ld: core.c:(.text+0x3a12): undefined reference to `set=
_capacity_and_notify'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_unfree=
ze':
   core.c:(.text+0x3af2): undefined reference to `blk_mq_unfreeze_queue'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_wait_f=
reeze_timeout':
   core.c:(.text+0x3b20): undefined reference to `blk_mq_freeze_queue_wait_=
timeout'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_wait_f=
reeze':
   core.c:(.text+0x3b4e): undefined reference to `blk_mq_freeze_queue_wait'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_start_=
freeze':
   core.c:(.text+0x3b78): undefined reference to `blk_freeze_queue_start'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_execut=
e_passthru_rq':
   core.c:(.text+0x3bce): undefined reference to `blk_execute_rq'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_stop_q=
ueues':
   core.c:(.text+0x3c4a): undefined reference to `blk_mq_quiesce_queue'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_start_=
queues':
   core.c:(.text+0x3c74): undefined reference to `blk_mq_unquiesce_queue'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_sync_i=
o_queues':
   core.c:(.text+0x3e26): undefined reference to `blk_sync_queue'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_set_qu=
eue_limits':
   core.c:(.text+0x56a): undefined reference to `blk_queue_write_cache'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_cancel=
_tagset':
   core.c:(.text+0x130e): undefined reference to `blk_mq_tagset_wait_comple=
ted_request'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_cancel=
_admin_tagset':
   core.c:(.text+0x132e): undefined reference to `blk_mq_tagset_wait_comple=
ted_request'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_keep_a=
live_work':
   core.c:(.text+0x15dc): undefined reference to `blk_execute_rq_nowait'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_comple=
te_rq':
   core.c:(.text+0x16e6): undefined reference to `blk_mq_end_request'
   arm-linux-gnueabi-ld: core.c:(.text+0x1718): undefined reference to `blk=
_mq_delay_kick_requeue_list'
   arm-linux-gnueabi-ld: drivers/nvme/host/core.o: in function `nvme_sync_q=
ueues':
   core.c:(.text+0x3e3e): undefined reference to `blk_sync_queue'
   arm-linux-gnueabi-ld: drivers/nvme/host/ioctl.o: in function `nvme_submi=
t_user_cmd':
   ioctl.c:(.text+0x70): undefined reference to `blk_rq_map_user'
   arm-linux-gnueabi-ld: ioctl.c:(.text+0xdc): undefined reference to `blk_=
rq_unmap_user'
   arm-linux-gnueabi-ld: ioctl.c:(.text+0xe2): undefined reference to `blk_=
mq_free_request'
   arm-linux-gnueabi-ld: drivers/nvme/host/tcp-offload.o: in function `nvme=
_tcp_ofld_error_recovery_work':
>> tcp-offload.c:(.text+0x10c): undefined reference to `blk_mq_unquiesce_qu=
eue'
   arm-linux-gnueabi-ld: drivers/nvme/host/tcp-offload.o: in function `nvme=
_tcp_ofld_delete_ctrl':
   tcp-offload.c:(.text+0x166): undefined reference to `blk_mq_quiesce_queu=
e'
   arm-linux-gnueabi-ld: drivers/nvme/host/tcp-offload.o: in function `nvme=
_tcp_ofld_setup_ctrl':
   tcp-offload.c:(.text+0x1de): undefined reference to `blk_mq_alloc_tag_se=
t'
   arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x1f8): undefined reference t=
o `blk_mq_init_queue'
   arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x20a): undefined reference t=
o `blk_mq_free_tag_set'
   arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x212): undefined reference t=
o `blk_mq_init_queue'
   arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x224): undefined reference t=
o `blk_cleanup_queue'
   arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x236): undefined reference t=
o `blk_mq_unquiesce_queue'
   arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x25c): undefined reference t=
o `blk_mq_quiesce_queue'
   arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x262): undefined reference t=
o `blk_sync_queue'
   arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x342): undefined reference t=
o `blk_mq_alloc_tag_set'
   arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x35e): undefined reference t=
o `blk_mq_init_queue'
   arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x372): undefined reference t=
o `blk_mq_free_tag_set'
>> arm-linux-gnueabi-ld: tcp-offload.c:(.text+0x380): undefined reference t=
o `blk_mq_update_nr_hw_queues'
   arm-linux-gnueabi-ld: drivers/nvme/host/tcp-offload.o: in function `nvme=
_tcp_ofld_reset_ctrl_work':
   tcp-offload.c:(.text+0x454): undefined reference to `blk_mq_quiesce_queu=
e'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7791261033482662116==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICOqHsGAAAy5jb25maWcAlFzfc9u2k3/vX8FJX9qHtJbtpPbc+AECQQkVf4UAJdkvHEVmEk1t
ySfJbfLf3y5ISgC1kHOd+d7F2AWwWCx2P7sA9esvvwbsdb95XuxXy8XT04/ga72ut4t9/Rh8WT3V
/xOEWZBmOhCh1H8Ac7xav37/c7F9Dj78Mbj64+L9dnkVTOrtun4K+Gb9ZfX1FXqvNutffv2FZ2kk
RxXn1VQUSmZppcVc372D3u+fcJz3X9ev9eLz6v3X5TL4bcT578HtHzDoO6urVBUQ7n50TaPjcHe3
F1cXFwfemKWjA+nQzJQZIi2PQ0BTx3Z5dX0cIQ6RdRiFR1ZoolktwoUl7RjGZiqpRpnOjqNYBJnG
MhVHkiw+VbOsmEALaOzXYGTU/xTs6v3ry1GHwyKbiLQCFaokt3qnUlcinVasAJlkIvXd1SWM0s2b
JbmMBahd6WC1C9abPQ58WETGWdyt4t07qrlipb2QYSlh4YrF2uIfs6moJqJIRVyNHqQlnk2JHxJG
U+YPvh6Zj3B9JLgTH5ZuzWqvvE+fP5yjggTnydeEVkMRsTLWZm8sLXXN40zplCXi7t1v6826/v3d
cVh1r6Yy5+SUeabkvEo+laIUJMOMaT6u/PRSiVgOSRIr4XATKzE6ZwUMazhAPDCMuLNUsNxg9/p5
92O3r5+PljoSqSgkN4adF9nQsnWbpMbZzE+pYjEVsb37RQg0ValZVQgl0pDuy8e2+WFLmCVMplRb
NZaiwNXd2/OkIZyXlgF43Y5RVnARVnpcCBbKdHSkqpwVSrQ9Doq1RQvFsBxFyt2Aev0YbL70VNlf
GIcDOQF9pFp1uter53q7o9SvJZ+AmxCgRX0UL82q8QO6gyRLbQGhMYc5slByYv+bXhI0YvcxrZS1
yNEYNwdESMB5mC7t+k7EPfiTPOodcQFN1d9SdyuFP51lHsRAvtYiSZ26Ha2DVAiR5BqWkQpiFR15
msVlqllxby+9JdrdGpHy8k+92P0T7GGhwQIE2O0X+12wWC43r+v9av21t0HQoWKcZzBFY0aHKaay
0D0yGgJ5btGsUNkWL8k3VCEeRS6UQlZNMmmmJkozrWj3oySp5Z9YudFQwctAUdaa3ldAszUAf1Zi
DmZJuSTVMNvdVde/FcmdytLWpPkHrcrJGI40mC0ZJjHwgbWNZaTvBh+PpiJTPYFoGIk+z1X/DCs+
BsdhTnJn2Wr5rX58faq3wZd6sX/d1jvT3K6CoFpxfVRkZU7vFMYW8Eaw2SQZ5OCTPAPJ8azqrKCj
RSMvBn8zFc1zryIFfg1OBWdahCRTIWJ2T1tlPIHOUxMnC7rzMMvgMPh3DXBVlsMJkA8CfTP6Mvh/
CUs5dbT73Ar+4SC9rMghAEAkLayAgT5Gxz0vVcpw8PHY1pirbcSGgZAhAQggIRQXNrMaCZ3A8aP8
maPrYwRum6MmYB0bGphw8MCOpfb/rtJE2tDO8UNDBuEsKvvOtZu3BCRPUkSeefooOUpZHIXE6oy8
BnYfx8F4F9FmwWRGDCKzqiycoMzCqYRVtFqz9JGIZMiKQppt6DAdstwnygGRbVtFb8qBbJSFlq7l
1NoMA50Q+B/nA2FSiOhw7Jx5eJIT4wOicOCEgRCmlVZ9MhRhKCgFG6PF01EdcERnCtgIBllNE1hN
xp1wxwcX1yfBrk328nr7ZbN9XqyXdSD+rdfg9Bm4Lo5uH4K9Haqtickg8pMjWkEyaYarTNjree2j
wcXlsNEZ5QwgNWIa8qqJcxJjNqROH4zksmU0GxvCXhcj0aH9/thVBAgilgqcLxzcLPHIbTMi9IUg
Qp8ENS6jCABrzmBOs38MXDrJmiQsNyyzqkzR50oWgwOkxwW0EMn4BE+0++XmqEdrTxyvWakyz7NC
w+nJYb/A88HxyCzPCkBSZshRgWhWV834RBcQwboRLCcN8RMCzimhi7PjmQAYShDAA8hhAWEKtgYi
Uu+QHkQtTcpin48xrCSLIiX03cX3y8GF+a8/euM8uy4jzYawKSaHUXeXbbg3eCTQP15q+2wkSUlY
khHK7FiRhtUQcq8qgSzm5hydzS1sApsBDjcdxZjAJdO/EtsSTW+R317NaR9u6BHE3mEhwxENEAxP
mE3PUBUbgLrO0K/45fU5EZi+HfipyZzOlJuxdXJ16SfH4Npu3KmdoXN12cG0fLtZ1rvdZtttXedA
AKM3erUa9LhMhlka3xPNYII52oVLurr8tz8IGxaYnoBluO25IcRixHhvfM4ArkGXnGo+ERIaqrRM
TLJ6eX3RX2Z0RKOWMZkl2EaEI8lmhlAqXBgN0YAt/Dm2IQBJSEQ1xWhJEg/ahTVY+4NNCxOGwRah
eATJvaNtOMGGBpk6szQSwl8mgBPH29AMTLz43pEsZIvnbyo4eFxIejNw6bQ/R8GSvCRdqe0Vmnz3
FfPkl5fNdm+nA3azHYVPN8uEAq/DMuadFtUol9mxcAlZfiTnInRaoGevVHDpOc1I+uAlXfl7ffCT
UG4KyDzcDY6rabKUcYE5tZUVoqletkU6y9ELNpQ9vz9jACKME2dxNS4Bh8dDC11juQcda/WQpSKD
OFzcDQZWlARLwnydDqEt8XyG7iKg6JjqoSlsgG3zgsV0a38Rq2WR4841G1F564NJn4osacruF98v
TilDpQzBMVaW5yIFIFmFmoI5PAlNDfudVbqcy7xVOH28C6YgXJQkzMUss3pA+ByGhZ3JOwroCi1B
vvkPsuJksV58rZ8BJQLhQIu29f++1uvlj2C3XDw1dRfHxwCs+kTuAN37MLB8fKr7Y2FhzDtW08Fu
OZHbjBc9bRZYJgleNqv1PqifX5+66xNDZ/vgqV7sQA/r+kgNnl+h6XMN8z7Vy339aPsK75CNozdi
PB/EsCzsCCtLhRZA27XHydkYzxdX23ExS1Vy2JYVW6m9cjVqWm2f/1ts6yDcrv7tpReRLBLI2QV6
d3DJpHijLEMs1LGeJDW6/rpdBF+6WR7NLLZSPQwHnffls++aIggTCcSIKJepOlQ2OxS92C6/rfaw
i3Dy3z/WLzCiuy1W/IpUz4GhN8BLGfAscJZnrH/54qT4x3q+gdfjLJucAmWV5May2yo3UWdHImb5
KFGZ352mu+A3tYzuK5WV4EAJhokQeVP2IYhtnM6Ke1JyIxXgu6IEpDAbS23SpN44V5eAiTEKVro3
SCFGkJCkYZNmoF82VdG8r6Y29z7Jn7E/1Y41nXZMdHMn62r2oikWQrY/5+MRFYtkzqvmKqG7lyN0
oATH9PUMCQw91nZ146TLCePx8LeUFrR58mczpVkvZEzagKBeCvdmO25iZtdrYogDWJbvLQz+jQHM
GO3EKfAYsqdi3uMiauU9jiQLWx3mgstIWnfOQCpjocxpEzEaQUwYrqGYtN4pLDbXGnOwx/6J4jEs
FrAnn4BPCi2zyvCSVY5ad3l1QmDczaTbYkZj9bhKQjqTyIKCQ3MNe9htzKjtYgoFJI7m6SuSHg0w
j9JqCrl2eHBzPJu+/7zY1Y/BPw3Kedluvqz6wRnZCATRX4Vha6oTpuBhR5BzMzmC4hOCPC5H4I0t
9+Y0WnJ1zRW/50bTMW4mXdO2uCESolLhf0WWv8mNdtP4tLMVlzdixaGWi/VIhQW9OwuutlbsKcaD
HVBFVfNcAY4EyFimxljcW9GGbnxyQz9HI/vOCvDhvs420e3t1m2YhlPHK4juhOmDT6ky8KcxAFv0
Dogz0euba5LOTsX3evm6X3x+qs3Dl8CUIvdW/B3KNEq0OeVRmNvuAZraiq7Lqngh835oQoFaegQ2
ctLJ24hvPKY5vvbIzTsQ9KVOxd5iBT9Bb3PD84BMxG53co8BIoWdJP3OiVR04QV10If4Bwv2qdfo
PqmfN9sfFjY+RT8oDKACKznDdaZZaGCfW0E0ekaMYQrvrl2pPAYfmWtjUBA11N2t+c9O3EZotGhX
vXStZTClmaotoUJUkoB85wgj4LB1LAL0B7jAxKWJU3zjsWCpia2kEh/yLKNzqIdhSZX2O1gmWBHf
VzIzZQmnii8KlMJ/tzsq85MXQod982/Nca0HSJvW+/82238w9zjZQDhrE+HYU9NShZJRWi5TOT9u
G/4F58nRpGnr9z7eZ8f0aucRZLiI1ujbUxBoIu5JT+hKDwmvuczjrK+5IwMLp3gXGUKqXWp3xiNT
ntpPVszfVTjmeW8ybMa0nc5vWoaCFTQd1yVzeY44KhDtJSVdkFX3EAAhYZCeANKMMdXSS42ykhYd
iWzspwnlWXMzJ4ZkP91vHzxHZDk6bBJ1L9nx8HJoO/zuLVdHv3u3fP28Wr5zR0/CD8r33CCffiQJ
SQ49fSrEd4IIzxNWTM7yANYzMBDOfJL7XoUAcwP+6UiRnyGCtYXcIyfQFPdYKYBcei98r97A55Pt
8aVnhjM3FsYaFP0acBoDpL25uBzQN6uh4NCbliTmnnsGzWJ6l+aXH+ihWE6/z8vHmW96KYRAuT9c
e9dsiqT0sjhV3gtThU9DMnwC6r4I0AloCY4LOVgGqcpUzaTm9FGeKnzF5glBICfAvYn/tALq9vud
VNFTjpXfyTeShoJeDHLEV4AqFByBysf1qdD+CVLuPpmySMW8Gpbq3hRRLKj3Ke7F0WBf7/a9PAn7
5xN98iSsDdcnPXsEOzRbimJJwUJJP3bljH59NqQtkkESPC985znCtw4kaSYhqwYQRTuOaCI9z0pQ
Ibe0M+BMRjRB5OPK9xo2jTwvcBXD3M8f/SKaFs90mdJprTFEyB4QfTlZZ8RkjBkL0UfosQaI2B2Z
zmTC+t/V0i6PHrBwUrFk6OT8OefMfXF1LEiulu0YQXZaFy6bQsFYxDkpGxwUneR2kbJrgeSzTK28
BiJTGrLYKfbkRTP8oZ5rXpt3CzxUWJ82i8e2Nttpa1bFGb7eI49Ev+NBM+YtBL5A6xKX07c2YSGn
nhjYMohp4UFEDQNubTsM3hj2Lsx7GN5UsUqd9d5NF2Lk5DfN31WSyMypf9D7d7hWfDQm4mzosOCJ
0sNqJNUQTIU+EFMxz02+3PxN++exRJ9GboA9t50twqHgvtcqo9TjCRJNAbVQW+jMvR3LIkwUtOcT
CKBiIqkLIewB2myKJE2y4d9OQ1tOcNqcUgX83SQPx7/xEXsxhcygyWltaZtKBZWCNG8T8H1LW3g2
teL2IYx98YhNJ8c7nSYiUIer5c4FQevJezTTaLKbnOkx5biQIWKAtri1btOKyDeLIjyQtnE6szdJ
/2q3pGwSTmJyjwok91+kPM5UCd4BFSh9z1yV7zJ+js+aIJUMI+GpYlyS2hMCDmXiXM13EhlKdXvF
5x9J++91be+bvi92gVzv9tvXZ/PUbfcNfNRjsN8u1jvkC55W6zp4BCWtXvCf7mXU/7t3c5n4tK+3
iyDKR8y6ytr8t0bXGDxv8MFx8Bvegq62NUxwyX93VsrHNETIpzlLJSdX72xz8xIKkVHTYumz2zgg
YqXSth2qgxVCwQejHVjleikdaxbaWDgdTLHkbH8pAcwQhcKsgADBOJYf+di5bcesiFVaUePZvRP2
4Lx2s0ifSpZqyfpCduSCtkyLZVjA8eLu+8FTLg4xMeXOyU4YifmdTlNZJh7RuCyKkroisHlM4cxZ
3EgkMpUHbdPhMrm98DwHCX19rFnFA3778xZXxADnkr7VYmruij0aGEsFHoSTd9w2W8lm4sQKW6JM
tRcOtiyJ5EWmskh7hkgYRI8ziNga5qemcj+cOhFEJL61pEwj9fwU8M8iSzP7XsqmumPLaj7CVzcp
A7NprlA82w/2lJHfLR3HhqRU4ZWcR3o4iDF+FfWWHguQQTF/BtqxYYrrTwlbLsgjVOkvyhzYhPtU
heDIYlYARilovapEOc+5VcJvBwPq0SNyIokeJuMScPrcZ4pKGxt5Q9T7NMvVvZPkhDNezWOAsm+6
u6mkyzYWy0w+9MzklKeJ/bYILRoQIEMMnv4cYmBzafjO8cQx4P0eTxcix/eQcFoJ0CwfO9+Wxfhh
YSFHI0gUgEQMYZ7oVU23BkFJGSBrGxofT5/GsCTsD3akhTL1E9sQ5WeY39z8dftx6GXoQpSfgScf
rgfXF+cY/prP5+foN9c3N4OzDH+dGYBLiJD+JbaBzEsPIVKeW6DkeVwqLzmea39XjBDVfMbu/d0V
BtTBxWDAvTxtlHiTPrgYvclzczO/hP/8fCbUnCWbKPMTHNq/pYdw5OVIzQs05pcknecVv/5Q6b8Z
uDy/dXw6O00hEAhOztBNxPDTIVScVQf6ZD9Ri8HFnIY7CE/B6UFm5rfc/Obq5sxeIl3zm4F/H8wI
1zfn6R//eoN+66VPwRsrJbz01uGOwAVeFvh/CX+ZhDKrmuTAyg2wcVi62To29liawo4DnU1PqYfM
E7sbBp5gvcEXKAwPYsgq8gYTwwO7zzGRoaGJYZH5p+uLwe1ZhpuLj6dfcCExSF6f9pAb1t97IaNT
EOT/87YGEIu5B9W4zAnePo9Opsu5OhOigFrNkYVKHomuVs/c811q7CYCZrbxZrd/v1s91kGphl0W
abjq+hF/7GSzNZSugM4eFy+QLFMJ/yz2VMRnvnYfoUlelWeTzaUpUQg+RgkVpicLleuX1/1pem2F
lrw8LW+MF9tHUw2Qf2YBdnHfA+NvBNB1OpaIfr3ksHvUoIefPKDEbOb8ttgulqj7Y3Goc23agUxT
Cu/hq4BbcEzaBZvNZzOmmegUhxK8LZZe27pVU6iot6vFk2W0ljogwJgaIXd/UKEl3fS+h2gKcJv1
e0PYNeMaCyR2qB0Dq/ZVHl8M6KS4z0V/KdUTtfkuDOIa/grJuQ4lK3QfEbsc7osnqxEru5CZCEIt
SkbS88VYx8F56olrLQc42I++D9c6nTQlmr81G+E6foL1LbY23OTqhNPlww/HDIulBA8HoR5f4acl
Ryqu4vwtUQ2XTCNw2m+xckzr8FlnKEeAZGNPLb7bGl0xz8uvjiPvf8ffFfDcg9RTSQqqMtdBhfMF
eFqNw9iTGlYj5fGZJeZgnteZ4ynHdwvnloDXQSf3GEfv034574EskC5k3cbTDjsHRNl8sk+rejwj
PgzuIJOY9i4LNIf/eb7HAIuN7303Mqcu1gKmZn5IRUvYcHxwdHq11sSZS06Gl0u6DGyzW9xXnt3I
6XdEKk9owrj/+yQHjKBOJM91HiyfNst/KPmBWA0+3Nw0v9Vx0leszRPGJps3v3fifXOz30C3Oth/
q4PF4+MKL+PgDJiJd3/Y1fxTeSxxZMp1ceZJNL6Ph52CHcNP+iqnVI0tvlvuGR0v8mxmLiqVp+TW
0PHZbew5Y7Mko8EOFn8TRi3F/HRVmFkP8ruWk5upAyHNIDnOSsoXH3jaX3MyH7uJFL8GDYkp8OGK
2TkY7e6CmMr89saJJcwW++W3x83XIN/W+OM3G4Azow34t/XGBbiHcfJCtNNUo2zqH/DkKv9o/lmk
D+Ody4sonoPdAALIby4+2Go/1jyaK4Pzk0R6FmrAJee5wtl5esLmGMjPyarU0P1W7NhOcAMyYCQ7
Ek6TIMx/vryul+Z7On9+kkQhPkMTEFkhpHLPbzYcucYxDz15HfAk6EvpYiaSx/Lj9SVk3cn/VXZt
TY0jO/ivpHg4NVPFsMtlIPMwD47tkF58SXyBcF5SmRAgNUCoJFTt7q8/ktp2utuSyXmYSyy53feW
1NInxRcxKvDKN1f+uVjETRiPBe9vqkBxef7jSiSP4/5UEK6QnMff/zxlup5o97kjDOPTQoGIen7+
fTorcphccs8UV9Hl5ZTfrIjuX573rz5h+HHexTCJp33+irZzMphGnWuMcJQQNsJAeTM/9OuwhA4u
hkP74Gzm78+rxZY7moIsbvHDarbu0Kv2mI+198xm/rrs/fp4fIRDP2hfug8HbL+wr2mHkvni98vq
6XnX+08PZnyHwglUxObM88oWw5tqPf8mIs8GmbV2J/nky407jNuV5j5aJpwbSQn7TTryFQjQRQEn
R5jAWFlTGjk6RzcWZngY5xilznw0CRHu0Az/wl+6H5wLguop+qUILo8Gk/ZOF6V64hxk2OcJOveA
6OnDgXkdth3DgJXbGXUJqI6d9Ts+gQzf+x2Fku3l18vq7feX069khMmuB0SHdz7eHoAjf18uUIMY
qaYmvS/wA4QKELXir3vdnL7Z3orocRxNHfuUTRejAogKO1kUlxWIYqs5w5f59pkEwmK9WTw7fda0
uNisnp4sY4IuW1/8uHOgvg8ifCyB1sJ6tKgj0PyLQehJ9GbdCXR/XLa6saZhFOKtEwnH8dXe8jQi
1BOrd4oE2vZ2ujv2A50sd48r9FLpLQhMuPcFe2033zwtd19bk6/pH1BachUmgou21SAvlg5gi2/c
dmjh2LQF75DiiiLMeMHY7tRS8sO1WyyouDqeWQ1ADBQ4FPydqIHHboBh4Pl1LF3uZ6VxYUmkFu5S
BgKJvtfcH5KFr3cgXipECejW9dvSLqyxNyiHLB4BgqZhyKdUJEIvom8lqAUYed7F1gpodhlgybjQ
itWJ4lTQ6PVyGqh8LCEd3g6FIaXQZe0cylklK4tCHCbWIqwfx1KpwdjjSkObX7sweoqXanl13FWm
0rbAvFps1tv14643+ud9ufl223v6WG53HFrNZ6yGipqFbStFrYukKCvxdoDCu5biWq7TKBgq4Xz0
RxmUOoOhKhApUvAxDaPIS9Jpw8b0pta8IyOyEH6g9ShK05vSjc0HGqp/Y8+0meqTpCrEbHX1lFwO
4F8J/tXg1K4B4oyotMJbn4/AGt1hfC9r7/DJLpGvPzaWdlSr9HguaX9b64njvww1zDO/9ld2Hmqo
rX3f7++JVXF5wYulbK1MzVJFg3Taaky2fF3vlu+b9YITZ9A7u0BXTd6AxbysC31/3T6x5Y3jvF6s
fInWm450iuEQrQbkULcvFWRU+tbzn1fvX3tblI0eG7/vRtzwXl/WT/A4X/tW9WoVgSFryX6znj8s
1q+tF5vq+bXfOC+fc+/rC5Dp+I/hZrlEdJ1lb7LeqIn0kUmpfB82JFjlvBbwWVlazjiJp1L7WzTT
vhetdktNHXysXlAwaXqZE4RVEU6pX+BBkaVRy7xbewIfXDoVP/mYv0BHtkeiKo6l2wNlx2PSy1NE
RPhbKpOjNmb8g6bfvgLjGPW4NuRSLVFMC1+wFWr8F15+Efa48V1bO0Yn8gXUsu1mDBTb5RHNYsmt
shzm8DbFFQINxHarZKOCGNcsXiKQaVWYJ9o6Pbq3kLL351oVJNLh7TS7SRMPdVTZtQPN1LWRr0iz
TBKaTb7gkMJyL7oVRga48FZKxdN+PMHqiWwxnGMR/D1W3R8dT73ZWT+J0e4vRGuZXNgjIlfqh1GK
cVhZ4AYT1AZ6a0iMt9EY7guIU7HPNzPz2pKv9/awWa8eLM+9JMhSxV+n1eyG6OrxNjuMumgvi9Ed
BgosMBaQu34WYm61T1oxYqvEFGkYlzDegDUkC7c2uUqFC95IxdLKwvplvo4qEuQlAgvmRXvb5l5F
nMFerQfd2u4J3gaRZIe5xmpiw/SmqCgNLQtO/UyjrczSMSf0E7IN0i2EohjvR2G93rt0oy8xNia7
H7sAbCYHKBqSXhh0qE5K02QDydDreHtSpgU//uhwMcwvZm5aDIssUYeIxiTQqhiqGXNv488Xz47t
M2fgOGpJU3PrnXm7/HhYE3zJflbUWwGIjRY6Gz1osOP3WwY+hpMnCrKQCyFABCSzGLp7stUD/Ifp
lXqvalfSFK5zrUdDsUUYC4EcdJ1pcBle4fRd+/ftmfP73LrEpyczz2eDEJB44bx+MTttPTE+MaY6
0Bqg+z+XEoVTllqXDafQOKK4AvITnamgThFzpEGjTtabpyOnAfherK4zCdwwwxvGxB4ofBFnaOV4
FCRsb1dMVUKhIHE6t0LCnZWBiXntVu5MYyyhtzHzjWuC0tZpXgwrHyJpOz9bg9EkjHG/l8M80lHA
xlQtk2zsu79n12ZkZPUMrY5obNb4rPvdXVNlCw3FbQtL3lcSIQ08cYdpLaS6pWa6APjRALofrbbr
fv/7j2+n5iSJsK+CkKCDLs756zWL6eogpiseKMJi6gvIuw4TL/84TAd97oCK9y8PqdMl74LgMB1S
8Uv+OtRhEiAybKZDuuCSx25xmHjHXIvpx/kBJf04ZIB/CGjnNtPFAXXqX8n9pPIU5/6Mv+6xijmV
EKFdLnkSeLmvBDghoy7y+zWH3DM1hzx9ao7P+0SeODWHPNY1h7y0ag55AJv++Lwxp5+35lRuzk2q
+jMhyK0m83ZGJMeej8DTkkN0xQEqWSEodnsWEObLjFc5G6YshTP7s4/dZyqKPvnctRd+ypKFoYDL
VHEoaJcn4Co3PEmphGhXs/s+a1RRZjeSERx5ymLIr+IyUbg8mTNRpbO7iRmXbSlIlcf04mOz2v3T
hn+7CW1/bPwNYsukRHwMGQ5vjCi4OSFpwhuY3oc/yCvVJwyoYJYFCLNghO5eWo4TgANCv0QdaRbE
YU7mmiJTgkJZ83YSWfGCLgXqzC6kVvnp+H6fwcXsqRYbrw1ZmMt8jVDk9amYGEa4A8VF39fuu8Iz
xLooj38evczfHtAGf4x/IYDA8T/z1/kxwgi8r96Ot/PHJRS4ejheve2WTzgjjn+9Px5ZqQue55uH
5ZuNFWiiQa7eVrvV/GX1r5NOlnKeaqTlCix4byLbA6pqMNUo9G5krZVnH9xnIQ8b1MHvZogyVGcE
ok700BpX4Z3MmPxH5LWBGd1ecjIKMJ28d8p21qohMuNasnZW7cCw+rWZwzc364/d6s1Woscam5mZ
TgNVILBPlruYyOTBylEbKPIiS3xYFkPE16iSpjEsUZgIVIygKQsVORp05qS7NLRzRIhOynjAX8hm
VWxh+0tjX8H+2EYhReWugvsmHQumilWXDI4fXxWCwSrzT3mhAd8rTv8MJHwrIKuinHHesUA7P3Pq
cH7WwFBJb6DpzQ8H933mVU3hhYqKxcvuPCG+WnMMhEMPqILgDhSRwAtSkRrQxwTgl8znT0TtES/0
UcM1/S/CBHL6dzVFzM29niI5BtdT1jiYLplnId7nOKFMxFt8FJhJlDHbTTo2FVWEnaUcON6YtvvQ
ZoYKIloALIFRiJZ/Z7JW6PvluF0yPoDdtn6Rck9ZsfxA99Bq3+VdQdUawFE9chEsa55JZGrdCL7U
XmraPeXywvw8JRtO2SR9MOjDwARfUgH6cYJQkblZwJJ0lqOLgE4YbJybKHcIo19tpq2t0a01VKOK
4MAc44Q9FjaBZs1mvfit4f7o6fsGTs/f5FP28Lrccpi6Oo9jhfhubmP4GJMesge8r0NUMGkp5Shr
jBtXIsekVGHx86IxR4d5jvpbq4SLfS3I7b6qSiBmAQ3uEw+9jTomjskhAfnk9/EgjRAGOcsou3YL
yg3+wDEzSHPe0Ct2tj7k1q/vIOx+oyy3i+fl4veWWBf6+YZzWtKfVcmQg8YYZlBJDaJ/+ufZhT3Z
xpQpHjNL8vtR6AVkFfSEIKgqle0Ms43wmSt13UDAIxtorPIYnfDNYDWbQjWdVYnNnBbqLEnDMtGv
eJG6TjAVAVu12zgCBWc6k/K0mEXeoXRVgWjzxvlDR8WCN6wWW7D89fH0hJKRgaNlOf5714pM+BkH
w1JV1II61E8qYME6OYFLRZMuMRAiYlcn1CW5mar3qtogd7VABwqws612xd10Wfop3hg0cCNa4mwK
s8W/a0xyAYpaLl0/6QKRkU5CXgCj5GV3iSCwE3mcqjxNJO8v/ZV08BfM4I60oC00dFMwrToE9moU
8NujWFM6KqD1kxI3Sb4SlLlMc2FGJErL3FHeLb/SNVED0uOhJmm11WCSVwVpGdyp4OvcPB5MqvrY
Mty1NBXvhvAwTFLgUgWmUt7DH7q6yX6mtLpn5OD7VRimwN9L1+/b414EiuXHu17Po/nbk6NsJLA0
MasDf4dq0fG+tgz3qe00kQn4wugqlNFR/gkLGZtSE2ejMtFZ01mmu4kQ/dRcOHe1VRtTmhTg7JLT
U0g+N4nOoP63EozLw4SdpHM1tVEdsNLGxvJlC4o/xTYe914/dsu/l/Cf5W5xcnLytX0qcv6G7mTF
FNOd0KrZXR4KR6RmqB2ZI2hCB1t1mU7ya4PGyysQeG0P06JA/ElRE7i705Xv1hdyf9hRVC1W/h+d
3JI8sskw8gR72T7JLt8EPO5hm56VSQ46BWYwkPMVV5ui3nOFRV0l5HmY7+Y9PIEW+4T39lgoobuq
0+MTet51KJCLgpKyRdOxkcwCr/BQyMxKxpHCWrtCk9yv+hn0H0JpRW1fhMwv+bUNhBkmLe+YZcjy
6VREJrROHVKWOBmQGk5ybqupPVmtdrg9AFuhFugyRpSrVxZmS/Lvi5RLEEmHciNgUkWzn7YtaagT
Rsfk4wNNRiOPw1KlgdfvgxBhpUHXXtrVi7oUSwUk6O/2AM43r9YA1oJZcqeSAKM5zJzY6GKoKW2R
QrRRVstCFuKhRSrxozIIfx69zhfPfzxgfb7Bfzfrk/xoXyXMk0Ewzg07cf7x8YbyMkzd7cmzcaeN
ilaOkUHsiNsNN5XYQiPP02HmYzz0/MnKnHlTJtL9RrU+UYcjlMy/tBbC27vJNsryuCaNGz+9bQky
IL5gKjE9bcaW2yfyc8Y/zBoX61WEx4UbSRHdBILnHGGAUzL3XIobJJZYJRR9InN0vx+oW8FWNtin
VMf8VfJGMEC46w46GpjyNEox8EDkIk+8W8qN1FVYbcjpPiepZaNw2s4sZXWMttHoOw0BvqPiy33h
CoUYboCjELwPiYEsGrzZlegDVUjKLdHL0vXqNKlTMgPKdHRsG4JSKHNkMLtHhZhoW3enFD5KVBUI
3ppK55rnTXhOP5PnW0cvyBYhvRTC2Pegs7tGkm4chL2kLqSbge5ZUKkUsx6i/R6KQW7DGbN54F63
8Jtf605Gm/n+B/7m89x8kQAA
--===============7791261033482662116==--

