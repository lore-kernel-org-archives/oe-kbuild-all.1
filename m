Content-Type: multipart/mixed; boundary="===============2759498737344633036=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [zen-kernel-zen-kernel:5.6/muqss 1/18] kernel/sched/MuQSS.c:1707:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
Date: Sun, 10 May 2020 15:46:54 +0800
Message-ID: <202005101551.t9Tp5H9r%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2759498737344633036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 5.6/muqss
head:   e70073b6a71de959a53ff82f74481c15fa23b2cd
commit: edbc5ae3fb7ae074a02e40802df66ae90ff4888e [1/18] MultiQueue Skiplist=
 Scheduler v0.198
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout edbc5ae3fb7ae074a02e40802df66ae90ff4888e
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> kernel/sched/MuQSS.c:1707:17: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
>> kernel/sched/MuQSS.c:1707:17: sparse:    struct sched_domain [noderef] <=
asn:4> *
>> kernel/sched/MuQSS.c:1707:17: sparse:    struct sched_domain *
   kernel/sched/MuQSS.c:1848:27: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
>> kernel/sched/MuQSS.c:1848:27: sparse:    struct task_struct [noderef] <a=
sn:4> *
>> kernel/sched/MuQSS.c:1848:27: sparse:    struct task_struct *
>> kernel/sched/MuQSS.c:2382:16: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@    expected struct task_struct *parent @@ =
   got struct task_structstruct task_struct *parent @@
   kernel/sched/MuQSS.c:2382:16: sparse:    expected struct task_struct *pa=
rent
   kernel/sched/MuQSS.c:2382:16: sparse:    got struct task_struct [noderef=
] <asn:4> *parent
   kernel/sched/MuQSS.c:4118:17: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/MuQSS.c:4118:17: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/MuQSS.c:4118:17: sparse:    struct task_struct *
   kernel/sched/MuQSS.c:5976:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/MuQSS.c:5976:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/MuQSS.c:5976:9: sparse:    struct task_struct *
   kernel/sched/MuQSS.c:6054:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/MuQSS.c:6054:9: sparse:    struct sched_domain [noderef] <a=
sn:4> *
   kernel/sched/MuQSS.c:6054:9: sparse:    struct sched_domain *
   kernel/sched/MuQSS.c:6461:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/MuQSS.c:6461:9: sparse:    struct sched_domain [noderef] <a=
sn:4> *
   kernel/sched/MuQSS.c:6461:9: sparse:    struct sched_domain *
   kernel/sched/MuQSS.c:6468:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/MuQSS.c:6468:9: sparse:    struct sched_domain [noderef] <a=
sn:4> *
   kernel/sched/MuQSS.c:6468:9: sparse:    struct sched_domain *
   kernel/sched/MuQSS.c:6817:17: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/MuQSS.c:6817:17: sparse:    struct sched_domain [noderef] <=
asn:4> *
   kernel/sched/MuQSS.c:6817:17: sparse:    struct sched_domain *
>> kernel/sched/MuQSS.h:771:16: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
>> kernel/sched/MuQSS.h:771:16: sparse:    struct update_util_data [noderef=
] <asn:4> *
>> kernel/sched/MuQSS.h:771:16: sparse:    struct update_util_data *
--
   kernel/sched/topology.c:92:56: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@    expected struct sched_domain *sd @@   =
 got struct sched_domaistruct sched_domain *sd @@
   kernel/sched/topology.c:92:56: sparse:    expected struct sched_domain *=
sd
   kernel/sched/topology.c:92:56: sparse:    got struct sched_domain [noder=
ef] <asn:4> *child
   kernel/sched/topology.c:111:60: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected struct sched_domain *sd @@  =
  got struct sched_domaistruct sched_domain *sd @@
   kernel/sched/topology.c:111:60: sparse:    expected struct sched_domain =
*sd
   kernel/sched/topology.c:111:60: sparse:    got struct sched_domain [node=
ref] <asn:4> *parent
   kernel/sched/topology.c:134:20: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@    expected struct sched_domain *sd @@  =
  got struct sched_domaistruct sched_domain *sd @@
   kernel/sched/topology.c:134:20: sparse:    expected struct sched_domain =
*sd
   kernel/sched/topology.c:134:20: sparse:    got struct sched_domain [node=
ref] <asn:4> *parent
   kernel/sched/topology.c:408:9: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
>> kernel/sched/topology.c:408:9: sparse:    struct perf_domain [noderef] <=
asn:4> *
>> kernel/sched/topology.c:408:9: sparse:    struct perf_domain *
   kernel/sched/topology.c:417:9: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/sched/topology.c:417:9: sparse:    struct perf_domain [noderef] <=
asn:4> *
   kernel/sched/topology.c:417:9: sparse:    struct perf_domain *
   kernel/sched/topology.c:606:49: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@    expected struct sched_domain *parent=
 @@    got struct sched_domaistruct sched_domain *parent @@
   kernel/sched/topology.c:606:49: sparse:    expected struct sched_domain =
*parent
   kernel/sched/topology.c:606:49: sparse:    got struct sched_domain [node=
ref] <asn:4> *parent
   kernel/sched/topology.c:627:1: sparse: sparse: symbol 'sd_llc' redeclare=
d with different type (different address spaces):
>> kernel/sched/topology.c:627:1: sparse:    struct sched_domain [noderef] =
<asn:4> *[addressable] [noderef] [toplevel] <asn:3> sd_llc
>> kernel/sched/MuQSS.h:581:1: sparse: note: previously declared as:
>> kernel/sched/MuQSS.h:581:1: sparse:    struct sched_domain *extern [addr=
essable] [noderef] [toplevel] <asn:3> sd_llc
   kernel/sched/topology.c:630:1: sparse: sparse: symbol 'sd_llc_shared' re=
declared with different type (different address spaces):
>> kernel/sched/topology.c:630:1: sparse:    struct sched_domain_shared [no=
deref] <asn:4> *[addressable] [noderef] [toplevel] <asn:3> sd_llc_shared
   kernel/sched/MuQSS.h:584:1: sparse: note: previously declared as:
>> kernel/sched/MuQSS.h:584:1: sparse:    struct sched_domain_shared *exter=
n [addressable] [noderef] [toplevel] <asn:3> sd_llc_shared
   kernel/sched/topology.c:631:1: sparse: sparse: symbol 'sd_numa' redeclar=
ed with different type (different address spaces):
>> kernel/sched/topology.c:631:1: sparse:    struct sched_domain [noderef] =
<asn:4> *[addressable] [noderef] [toplevel] <asn:3> sd_numa
   kernel/sched/MuQSS.h:585:1: sparse: note: previously declared as:
>> kernel/sched/MuQSS.h:585:1: sparse:    struct sched_domain *extern [addr=
essable] [noderef] [toplevel] <asn:3> sd_numa
   kernel/sched/topology.c:632:1: sparse: sparse: symbol 'sd_asym_packing' =
redeclared with different type (different address spaces):
>> kernel/sched/topology.c:632:1: sparse:    struct sched_domain [noderef] =
<asn:4> *[addressable] [noderef] [toplevel] <asn:3> sd_asym_packing
   kernel/sched/MuQSS.h:586:1: sparse: note: previously declared as:
>> kernel/sched/MuQSS.h:586:1: sparse:    struct sched_domain *extern [addr=
essable] [noderef] [toplevel] <asn:3> sd_asym_packing
   kernel/sched/topology.c:633:1: sparse: sparse: symbol 'sd_asym_cpucapaci=
ty' redeclared with different type (different address spaces):
>> kernel/sched/topology.c:633:1: sparse:    struct sched_domain [noderef] =
<asn:4> *[addressable] [noderef] [toplevel] <asn:3> sd_asym_cpucapacity
   kernel/sched/MuQSS.h:587:1: sparse: note: previously declared as:
>> kernel/sched/MuQSS.h:587:1: sparse:    struct sched_domain *extern [addr=
essable] [noderef] [toplevel] <asn:3> sd_asym_cpucapacity
   kernel/sched/topology.c:677:50: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@    expected struct sched_domain *parent=
 @@    got struct sched_domaistruct sched_domain *parent @@
   kernel/sched/topology.c:677:50: sparse:    expected struct sched_domain =
*parent
   kernel/sched/topology.c:677:50: sparse:    got struct sched_domain [node=
ref] <asn:4> *parent
   kernel/sched/topology.c:684:55: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@    expected struct sched_domain [noderef=
] <asn:4> *[noderef] <asn:4> child @@    got ref] <asn:4> *[noderef] <asn:4=
> child @@
   kernel/sched/topology.c:684:55: sparse:    expected struct sched_domain =
[noderef] <asn:4> *[noderef] <asn:4> child
   kernel/sched/topology.c:684:55: sparse:    got struct sched_domain *[ass=
igned] tmp
   kernel/sched/topology.c:694:29: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@    expected struct sched_domain *[assign=
ed] tmp @@    got struct struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:694:29: sparse:    expected struct sched_domain =
*[assigned] tmp
   kernel/sched/topology.c:694:29: sparse:    got struct sched_domain [node=
ref] <asn:4> *parent
   kernel/sched/topology.c:699:20: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@    expected struct sched_domain *sd @@  =
  got struct sched_domaistruct sched_domain *sd @@
   kernel/sched/topology.c:699:20: sparse:    expected struct sched_domain =
*sd
   kernel/sched/topology.c:699:20: sparse:    got struct sched_domain [node=
ref] <asn:4> *parent
   kernel/sched/topology.c:709:9: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/sched/topology.c:709:9: sparse:    struct sched_domain [noderef] =
<asn:4> *
   kernel/sched/topology.c:709:9: sparse:    struct sched_domain *
   kernel/sched/topology.c:870:70: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected struct sched_domain *sd @@  =
  got struct sched_domaistruct sched_domain *sd @@
   kernel/sched/topology.c:870:70: sparse:    expected struct sched_domain =
*sd
   kernel/sched/topology.c:870:70: sparse:    got struct sched_domain [node=
ref] <asn:4> *child
   kernel/sched/topology.c:899:59: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected struct sched_domain *sd @@  =
  got struct sched_domaistruct sched_domain *sd @@
   kernel/sched/topology.c:899:59: sparse:    expected struct sched_domain =
*sd
   kernel/sched/topology.c:899:59: sparse:    got struct sched_domain [node=
ref] <asn:4> *child
   kernel/sched/topology.c:1069:40: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@    expected struct sched_domain *child=
 @@    got struct sched_domaistruct sched_domain *child @@
   kernel/sched/topology.c:1069:40: sparse:    expected struct sched_domain=
 *child
   kernel/sched/topology.c:1069:40: sparse:    got struct sched_domain [nod=
eref] <asn:4> *child
   kernel/sched/topology.c:1373:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@    expected struct sched_domain [noder=
ef] <asn:4> *child @@    got n [noderef] <asn:4> *child @@
   kernel/sched/topology.c:1373:43: sparse:    expected struct sched_domain=
 [noderef] <asn:4> *child
   kernel/sched/topology.c:1373:43: sparse:    got struct sched_domain *chi=
ld
   kernel/sched/topology.c:1395:17: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@    expected struct sched_domain *t @@  =
  got struct sched_domaistruct sched_domain *t @@
   kernel/sched/topology.c:1395:17: sparse:    expected struct sched_domain=
 *t
   kernel/sched/topology.c:1395:17: sparse:    got struct sched_domain [nod=
eref] <asn:4> *child
   kernel/sched/topology.c:1870:31: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@    expected struct sched_domain [nodere=
f] <asn:4> *parent @@    got n [noderef] <asn:4> *parent @@
   kernel/sched/topology.c:1870:31: sparse:    expected struct sched_domain=
 [noderef] <asn:4> *parent
   kernel/sched/topology.c:1870:31: sparse:    got struct sched_domain *sd
   kernel/sched/topology.c:2039:57: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@    expected struct sched_domain *[assig=
ned] sd @@    got struct struct sched_domain *[assigned] sd @@
   kernel/sched/topology.c:2039:57: sparse:    expected struct sched_domain=
 *[assigned] sd
   kernel/sched/topology.c:2039:57: sparse:    got struct sched_domain [nod=
eref] <asn:4> *parent
   kernel/sched/topology.c:2056:57: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@    expected struct sched_domain *[assig=
ned] sd @@    got struct struct sched_domain *[assigned] sd @@
   kernel/sched/topology.c:2056:57: sparse:    expected struct sched_domain=
 *[assigned] sd
   kernel/sched/topology.c:2056:57: sparse:    got struct sched_domain [nod=
eref] <asn:4> *parent
   kernel/sched/MuQSS.h:560:9: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
>> kernel/sched/MuQSS.h:560:9: sparse:    struct sched_domain [noderef] <as=
n:4> *
>> kernel/sched/MuQSS.h:560:9: sparse:    struct sched_domain *
   kernel/sched/MuQSS.h:573:9: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   kernel/sched/MuQSS.h:573:9: sparse:    struct sched_domain [noderef] <as=
n:4> *
   kernel/sched/MuQSS.h:573:9: sparse:    struct sched_domain *
   kernel/sched/MuQSS.h:560:9: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
>> kernel/sched/MuQSS.h:560:9: sparse:    struct sched_domain [noderef] <as=
n:4> *
>> kernel/sched/MuQSS.h:560:9: sparse:    struct sched_domain *
   kernel/sched/MuQSS.h:573:9: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   kernel/sched/MuQSS.h:573:9: sparse:    struct sched_domain [noderef] <as=
n:4> *
   kernel/sched/MuQSS.h:573:9: sparse:    struct sched_domain *
--
   kernel/sched/cpufreq.c:12:1: sparse: sparse: symbol 'cpufreq_update_util=
_data' redeclared with different type (different address spaces):
>> kernel/sched/cpufreq.c:12:1: sparse:    struct update_util_data [noderef=
] <asn:4> *[addressable] [noderef] [toplevel] <asn:3> cpufreq_update_util_d=
ata
   kernel/sched/MuQSS.h:765:1: sparse: note: previously declared as:
>> kernel/sched/MuQSS.h:765:1: sparse:    struct update_util_data *extern [=
addressable] [noderef] [toplevel] <asn:3> cpufreq_update_util_data

vim +1707 kernel/sched/MuQSS.c

  1689	=

  1690	static void
  1691	ttwu_stat(struct task_struct *p, int cpu, int wake_flags)
  1692	{
  1693		struct rq *rq;
  1694	=

  1695		if (!schedstat_enabled())
  1696			return;
  1697	=

  1698		rq =3D this_rq();
  1699	=

  1700	#ifdef CONFIG_SMP
  1701		if (cpu =3D=3D rq->cpu) {
  1702			__schedstat_inc(rq->ttwu_local);
  1703		} else {
  1704			struct sched_domain *sd;
  1705	=

  1706			rcu_read_lock();
> 1707			for_each_domain(rq->cpu, sd) {
  1708				if (cpumask_test_cpu(cpu, sched_domain_span(sd))) {
  1709					__schedstat_inc(sd->ttwu_wake_remote);
  1710					break;
  1711				}
  1712			}
  1713			rcu_read_unlock();
  1714		}
  1715	=

  1716	#endif /* CONFIG_SMP */
  1717	=

  1718		__schedstat_inc(rq->ttwu_count);
  1719	}
  1720	=

  1721	/*
  1722	 * Mark the task runnable and perform wakeup-preemption.
  1723	 */
  1724	static void ttwu_do_wakeup(struct rq *rq, struct task_struct *p, int=
 wake_flags)
  1725	{
  1726		/*
  1727		 * Sync wakeups (i.e. those types of wakeups where the waker
  1728		 * has indicated that it will leave the CPU in short order)
  1729		 * don't trigger a preemption if there are no idle cpus,
  1730		 * instead waiting for current to deschedule.
  1731		 */
  1732		if (wake_flags & WF_SYNC)
  1733			resched_suitable_idle(p);
  1734		else
  1735			try_preempt(p, rq);
  1736		p->state =3D TASK_RUNNING;
  1737		trace_sched_wakeup(p);
  1738	}
  1739	=

  1740	static void
  1741	ttwu_do_activate(struct rq *rq, struct task_struct *p, int wake_flag=
s)
  1742	{
  1743		int en_flags =3D ENQUEUE_WAKEUP;
  1744	=

  1745		lockdep_assert_held(rq->lock);
  1746	=

  1747	#ifdef CONFIG_SMP
  1748		if (p->sched_contributes_to_load)
  1749			rq->nr_uninterruptible--;
  1750	=

  1751		if (wake_flags & WF_MIGRATED)
  1752			en_flags |=3D ENQUEUE_MIGRATED;
  1753	#endif
  1754	=

  1755		activate_task(rq, p, en_flags);
  1756		ttwu_do_wakeup(rq, p, wake_flags);
  1757	}
  1758	=

  1759	/*
  1760	 * Called in case the task @p isn't fully descheduled from its runqu=
eue,
  1761	 * in this case we must do a remote wakeup. Its a 'light' wakeup tho=
ugh,
  1762	 * since all we need to do is flip p->state to TASK_RUNNING, since
  1763	 * the task is still ->on_rq.
  1764	 */
  1765	static int ttwu_remote(struct task_struct *p, int wake_flags)
  1766	{
  1767		struct rq *rq;
  1768		int ret =3D 0;
  1769	=

  1770		rq =3D __task_rq_lock(p, NULL);
  1771		if (likely(task_on_rq_queued(p))) {
  1772			ttwu_do_wakeup(rq, p, wake_flags);
  1773			ret =3D 1;
  1774		}
  1775		__task_rq_unlock(rq, NULL);
  1776	=

  1777		return ret;
  1778	}
  1779	=

  1780	#ifdef CONFIG_SMP
  1781	void sched_ttwu_pending(void)
  1782	{
  1783		struct rq *rq =3D this_rq();
  1784		struct llist_node *llist =3D llist_del_all(&rq->wake_list);
  1785		struct task_struct *p, *t;
  1786		struct rq_flags rf;
  1787	=

  1788		if (!llist)
  1789			return;
  1790	=

  1791		rq_lock_irqsave(rq, &rf);
  1792	=

  1793		llist_for_each_entry_safe(p, t, llist, wake_entry)
  1794			ttwu_do_activate(rq, p, 0);
  1795	=

  1796		rq_unlock_irqrestore(rq, &rf);
  1797	}
  1798	=

  1799	void scheduler_ipi(void)
  1800	{
  1801		/*
  1802		 * Fold TIF_NEED_RESCHED into the preempt_count; anybody setting
  1803		 * TIF_NEED_RESCHED remotely (for the first time) will also send
  1804		 * this IPI.
  1805		 */
  1806		preempt_fold_need_resched();
  1807	=

  1808		if (llist_empty(&this_rq()->wake_list) && (!idle_cpu(smp_processor_=
id()) || need_resched()))
  1809			return;
  1810	=

  1811		/*
  1812		 * Not all reschedule IPI handlers call irq_enter/irq_exit, since
  1813		 * traditionally all their work was done from the interrupt return
  1814		 * path. Now that we actually do some work, we need to make sure
  1815		 * we do call them.
  1816		 *
  1817		 * Some archs already do call them, luckily irq_enter/exit nest
  1818		 * properly.
  1819		 *
  1820		 * Arguably we should visit all archs and update all handlers,
  1821		 * however a fair share of IPIs are still resched only so this would
  1822		 * somewhat pessimize the simple resched case.
  1823		 */
  1824		irq_enter();
  1825		sched_ttwu_pending();
  1826		irq_exit();
  1827	}
  1828	=

  1829	static void ttwu_queue_remote(struct task_struct *p, int cpu, int wa=
ke_flags)
  1830	{
  1831		struct rq *rq =3D cpu_rq(cpu);
  1832	=

  1833		if (llist_add(&p->wake_entry, &cpu_rq(cpu)->wake_list)) {
  1834			if (!set_nr_if_polling(rq->idle))
  1835				smp_sched_reschedule(cpu);
  1836			else
  1837				trace_sched_wake_idle_without_ipi(cpu);
  1838		}
  1839	}
  1840	=

  1841	void wake_up_if_idle(int cpu)
  1842	{
  1843		struct rq *rq =3D cpu_rq(cpu);
  1844		struct rq_flags rf;
  1845	=

  1846		rcu_read_lock();
  1847	=

> 1848		if (!is_idle_task(rcu_dereference(rq->curr)))
  1849			goto out;
  1850	=

  1851		if (set_nr_if_polling(rq->idle)) {
  1852			trace_sched_wake_idle_without_ipi(cpu);
  1853		} else {
  1854			rq_lock_irqsave(rq, &rf);
  1855			if (likely(is_idle_task(rq->curr)))
  1856				smp_sched_reschedule(cpu);
  1857			/* Else cpu is not in idle, do nothing here */
  1858			rq_unlock_irqrestore(rq, &rf);
  1859		}
  1860	=

  1861	out:
  1862		rcu_read_unlock();
  1863	}
  1864	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2759498737344633036==--

