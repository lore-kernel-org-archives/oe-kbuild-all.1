Content-Type: multipart/mixed; boundary="===============5383211998179866647=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/ethtool/linkmodes.o' being placed in section `.ctors.65435'.
Date: Tue, 11 Feb 2020 09:48:19 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E66249523A5211@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <202002111711.7PSCFEuy%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5383211998179866647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: [kbuild-all] powerpc64-linux-ld: warning: orphan section `.ctors=
.65435' from `net/ethtool/linkmodes.o' being placed in section `.ctors.6543=
5'.
sorry, kindly ignore this reported warning, which will be blacklisted.

> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   0a679e13ea30f85a1aef0669ee0c5a9fd7860b34
> commit: f625aa9be8c10f2e4dc677837e240730a25feda7 ethtool: provide link mo=
de
> information with LINKMODES_GET request
> date:   6 weeks ago
> config: powerpc-randconfig-a001-20200209 (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout f625aa9be8c10f2e4dc677837e240730a25feda7
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc
> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/dps310.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/hid-sensor-press.o' being placed in section `.ctors=
.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/hp03.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/mpl3115.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/ms5611_core.o' being placed in section `.ctors.6543=
5'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/t5403.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/hp206c.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/proximity/isl29501.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/proximity/pulsedlight-lidar-lite-v2.o' being placed in secti=
on
> `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/proximity/srf08.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/proximity/sx9500.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/proximity/vl53l0x-i2c.o' being placed in section `.ctors.654=
35'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/trigger/iio-trig-sysfs.o' being placed in section `.ctors.65=
435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/mcb/mcb-core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/mcb/mcb-parse.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/intel_th/core.o' being placed in section `.ctors.65435=
'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/intel_th/debug.o' being placed in section `.ctors.6543=
5'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/intel_th/pti.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/stm/core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/stm/policy.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/stm/dummy_stm.o' being placed in section `.ctors.65435=
'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/stm/console.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/stm/heartbeat.o' being placed in section `.ctors.65435=
'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/nvmem/core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/nvmem/nvmem-sysfs.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/mux/core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/siox/siox-core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/siox/siox-bus-gpio.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/s=
ocket.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/sock.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/request_sock.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/skbuff.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/datagram.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/stream.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/scm.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/gen_stats.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/gen_estimator.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/net_namespace.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/secure_seq.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/flow_dissector.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/sysctl_net_core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/dev.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/dev_addr_lists.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/dst.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/netevent.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/neighbour.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/rtnetlink.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/utils.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/link_watch.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/filter.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/sock_diag.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/dev_ioctl.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/tso.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/sock_reuseport.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/fib_notifier.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/xdp.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/flow_offload.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/net-
> sysfs.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/net-
> procfs.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/skmsg.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/fib_rules.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/net-
> traces.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/ptp_classifier.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/netprio_cgroup.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/netclassid_cgroup.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/lwtunnel.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/lwt_bpf.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/sock_map.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/dst_cache.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/gro_cells.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/failover.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/bpf_sk_storage.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ompat.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethernet/eth.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_generic.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_mq.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_api.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_blackhole.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/cls_api.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_fifo.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_sfq.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_prio.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_multiq.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_drr.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_mqprio.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_qfq.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_hhf.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_pie.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_etf.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/cls_tcindex.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/cls_rsvp6.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/netlink/af_netlink.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/netlink/genetlink.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/bpf/test_run.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/ioctl.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/common.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/netlink.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/bitset.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/strset.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/linkinfo.o' being placed in section `.ctors.65435'.
> >> powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/linkmodes.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/route.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inetpeer.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/protocol.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_input.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_fragment.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_forward.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_options.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_output.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_sockglue.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inet_hashtables.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inet_timewait_sock.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inet_connection_sock.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/tcp.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_input.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_output.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_timer.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_ipv4.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_minisocks.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_cong.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_metrics.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_fastopen.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_rate.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_recovery.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_ulp.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_offload.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/datagram.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/raw.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/udp.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/udplite.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/udp_offload.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/arp.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/icmp.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/devinet.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/af_inet.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/igmp.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/fib_frontend.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/fib_semantics.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/fib_trie.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/fib_notifier.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inet_fragment.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/ping.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_tunnel_core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/gre_offload.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/metrics.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/netlink.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/nexthop.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_tunnel.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/sysctl_net_ipv4.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/proc.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/fib_rules.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/fou.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/udp_tunnel.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tunnel4.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ipconfig.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inet_diag.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_diag.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_cubic.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_bpf.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/xfrm4_policy.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/xfrm4_state.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/xfrm4_input.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/xfrm4_output.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/xfrm4_protocol.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_policy.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_state.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_hash.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_input.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_output.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_sysctl.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_replay.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_device.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/unix/af_unix.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/unix/garbage.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/unix/sysctl_net_unix.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/u=
nix/scm.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/af_inet6.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/anycast.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ip6_output.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ip6_input.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/addrconf.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/addrlabel.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/route.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ip6_fib.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ipv6_sockglue.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ndisc.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv6/udp.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/udplite.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv6/raw.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/icmp.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/mcast.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/reassembly.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/tcp_ipv6.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv6/ping.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/exthdrs.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/datagram.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ip6_flowlabel.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/inet6_connection_sock.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/udp_offload.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/seg6.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/fib6_notifier.o' being placed in section `.ctors.65435'.
> --
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/dps310.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/hid-sensor-press.o' being placed in section `.ctors=
.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/hp03.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/mpl3115.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/ms5611_core.o' being placed in section `.ctors.6543=
5'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/t5403.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/pressure/hp206c.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/proximity/isl29501.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/proximity/pulsedlight-lidar-lite-v2.o' being placed in secti=
on
> `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/proximity/srf08.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/proximity/sx9500.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/proximity/vl53l0x-i2c.o' being placed in section `.ctors.654=
35'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/iio/trigger/iio-trig-sysfs.o' being placed in section `.ctors.65=
435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/mcb/mcb-core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/mcb/mcb-parse.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/intel_th/core.o' being placed in section `.ctors.65435=
'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/intel_th/debug.o' being placed in section `.ctors.6543=
5'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/intel_th/pti.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/stm/core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/stm/policy.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/stm/dummy_stm.o' being placed in section `.ctors.65435=
'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/stm/console.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/hwtracing/stm/heartbeat.o' being placed in section `.ctors.65435=
'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/nvmem/core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/nvmem/nvmem-sysfs.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/mux/core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/siox/siox-core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `drivers/siox/siox-bus-gpio.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/s=
ocket.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/sock.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/request_sock.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/skbuff.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/datagram.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/stream.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/scm.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/gen_stats.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/gen_estimator.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/net_namespace.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/secure_seq.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/flow_dissector.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/sysctl_net_core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/dev.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/dev_addr_lists.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/dst.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/netevent.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/neighbour.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/rtnetlink.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/utils.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/link_watch.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/filter.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/sock_diag.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/dev_ioctl.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/tso.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/sock_reuseport.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/fib_notifier.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/xdp.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/flow_offload.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/net-
> sysfs.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/net-
> procfs.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/skmsg.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/fib_rules.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ore/net-
> traces.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/ptp_classifier.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/netprio_cgroup.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/netclassid_cgroup.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/lwtunnel.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/lwt_bpf.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/sock_map.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/dst_cache.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/gro_cells.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/failover.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/core/bpf_sk_storage.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/c=
ompat.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethernet/eth.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_generic.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_mq.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_api.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_blackhole.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/cls_api.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_fifo.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_sfq.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_prio.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_multiq.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_drr.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_mqprio.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_qfq.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_hhf.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_pie.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/sch_etf.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/cls_tcindex.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/sched/cls_rsvp6.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/netlink/af_netlink.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/netlink/genetlink.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/bpf/test_run.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/ioctl.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/common.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/netlink.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/bitset.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/strset.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/linkinfo.o' being placed in section `.ctors.65435'.
> >> powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ethtool/linkmodes.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/route.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inetpeer.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/protocol.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_input.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_fragment.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_forward.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_options.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_output.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_sockglue.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inet_hashtables.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inet_timewait_sock.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inet_connection_sock.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/tcp.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_input.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_output.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_timer.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_ipv4.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_minisocks.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_cong.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_metrics.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_fastopen.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_rate.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_recovery.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_ulp.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_offload.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/datagram.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/raw.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/udp.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/udplite.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/udp_offload.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/arp.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/icmp.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/devinet.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/af_inet.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/igmp.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/fib_frontend.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/fib_semantics.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/fib_trie.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/fib_notifier.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inet_fragment.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/ping.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_tunnel_core.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/gre_offload.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/metrics.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/netlink.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/nexthop.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ip_tunnel.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/sysctl_net_ipv4.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/proc.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/fib_rules.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv4/fou.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/udp_tunnel.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tunnel4.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/ipconfig.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/inet_diag.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_diag.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_cubic.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/tcp_bpf.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/xfrm4_policy.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/xfrm4_state.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/xfrm4_input.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/xfrm4_output.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv4/xfrm4_protocol.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_policy.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_state.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_hash.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_input.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_output.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_sysctl.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_replay.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/xfrm/xfrm_device.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/unix/af_unix.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/unix/garbage.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/unix/sysctl_net_unix.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/u=
nix/scm.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/af_inet6.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/anycast.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ip6_output.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ip6_input.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/addrconf.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/addrlabel.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/route.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ip6_fib.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ipv6_sockglue.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ndisc.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv6/udp.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/udplite.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv6/raw.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/icmp.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/mcast.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/reassembly.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/tcp_ipv6.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from `net/i=
pv6/ping.o'
> being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/exthdrs.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/datagram.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/ip6_flowlabel.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/inet6_connection_sock.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/udp_offload.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/seg6.o' being placed in section `.ctors.65435'.
>    powerpc64-linux-ld: warning: orphan section `.ctors.65435' from
> `net/ipv6/fib6_notifier.o' being placed in section `.ctors.65435'.
> ..
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5383211998179866647==--

