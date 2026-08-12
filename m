Received: from confino.investici.org (confino.investici.org [93.190.126.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1187C3793BA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.190.126.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563735; cv=none; b=iOdoXtLakXTtPQWw/kYBZBHP3WxvAAQQFDEE7vf7boknc+VSeXuXDvdDKkzxnkxkuBHGA9m6sVBI9l/cBngUwNE4YpEryZglTJZZDBcYH1e7lk0J0yOZXokgB8zoKYYzSYJ72H/m2Nt2u7v2PawE3uTSQnm2c8Nx2id9eh8Xj98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563735; c=relaxed/simple;
	bh=zBmgQxeY/MtveT9Q1e2xSNjVhCaBMzVUy4mD3WbvZsE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sHE4J6h+t4U6uqcjWO3eB3nEDraTQ3OSyecrrFX3u58/Zyt6dOmtLXW5ordm2XV/nsLATKYj5mLvEEfRZJJ6wPLEixbWUbOzHzBqeGtNFFR8XW7rqmKf3xyQ6bYqAmFRcbCc0H0f8eo7a+hP20SqRhGyEKo7qyUAhdJbIbPuPBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=grrlz.net; dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b=BkS87ko+; arc=none smtp.client-ip=93.190.126.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grrlz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b="BkS87ko+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1786563724;
	bh=Jh3L6NFmOmYmilNIdjzIX9mXTtK554mLVxUERBciK9Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=BkS87ko+EBIeGcqK7n+sAEyabsKiT39P7Nd/Dnkq5Bw/qVqFpRAACBgnkNjl0yr5o
	 MyLOnN/j0lxpv1oglmxj+XWqFVQT+VA2QGYGssDoFCDLOOS2Gjm/zA5LyHoIKHTyeO
	 Ypmk/8S837sngsQOr44kZnraNrTC0l/WjKqVtHa4=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4hKzQh0Trwz10yW;
	Wed, 12 Aug 2026 19:42:04 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4hKzQg0y3sz10yS;
	Wed, 12 Aug 2026 19:42:03 +0000 (UTC)
Date: Wed, 12 Aug 2026 20:42:03 +0100
From: Bradley Morgan <include@grrlz.net>
To: kernel test robot <lkp@intel.com>, Oleg Nesterov <oleg@redhat.com>
CC: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5Btip=3Atimers/core_2/58=5D_kernel/?=
 =?US-ASCII?Q?time/posix-cpu-timers=2Ec=3A1307=3A9=3A_sp?=
 =?US-ASCII?Q?arse=3A_sparse=3A_incorrect_type_in_ar?=
 =?US-ASCII?Q?gument_1_=28different_address_spaces=29?=
In-Reply-To: <202608130320.o3cNs7Lr-lkp@intel.com>
References: <202608130320.o3cNs7Lr-lkp@intel.com>
Message-ID: <54BAD005-B341-4BE3-9935-C82C6852505D@grrlz.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 12 August 2026 20:40:00 BST, kernel test robot <lkp@intel.com> wrote:
>tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
>head:   4fa377c19e111c539a530a8200996b911ceff9ff
>commit: a73d7f98e41a96d6e1bcb0e731ab185d9d67878e [2/58] posix-cpu-timers: Don't abuse lock_task_sighand() in handle_posix_cpu_timers()
>config: microblaze-randconfig-r122-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130320.o3cNs7Lr-lkp@intel.com/config)
>compiler: microblaze-linux-gcc (GCC) 11.5.0
>sparse: v0.6.5-rc1
>reproduce (this is a W=1 build):
>(https://download.01.org/0day-ci/archive/20260813/202608130320.o3cNs7Lr-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new
>version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes:
>https://lore.kernel.org/oe-kbuild-all/202608130320.o3cNs7Lr-lkp@intel.com/
>
>sparse warnings: (new ones prefixed by >>)
>>> kernel/time/posix-cpu-timers.c:1307:9: sparse: sparse: incorrect type
>in argument 1 (different address spaces) @@     expected struct spinlock
>[usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>   kernel/time/posix-cpu-timers.c:1307:9: sparse:     expected struct spinlock [usertype] *lock
>   kernel/time/posix-cpu-timers.c:1307:9: sparse:     got struct spinlock [noderef] __rcu *
>   kernel/time/posix-cpu-timers.c:1367:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>   kernel/time/posix-cpu-timers.c:1367:36: sparse:     expected struct spinlock [usertype] *lock
>   kernel/time/posix-cpu-timers.c:1367:36: sparse:     got struct spinlock [noderef] __rcu *
>   kernel/time/posix-cpu-timers.c: note: in included file:
>   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
>   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
>   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
>   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
>   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
>   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
>   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
>   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
>   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
>   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
>
>vim +1307 kernel/time/posix-cpu-timers.c
>
>  1296	
>  1297	static void handle_posix_cpu_timers(struct task_struct *tsk)
>  1298	{
>  1299		struct k_itimer *timer, *next;
>  1300		unsigned long flags, start;
>  1301		LIST_HEAD(firing);
>  1302	
>  1303		/*
>  1304		 * tsk is current and ->sighand is stable, see the
>  1305		 * tsk->exit_state check in run_posix_cpu_timers()
>  1306		 */
>> 1307		spin_lock_irqsave(&tsk->sighand->siglock, flags);
>  1308	
>  1309		do {
>  1310			/*
>  1311			 * On RT locking sighand lock does not disable interrupts,
>  1312			 * so this needs to be careful vs. ticks. Store the current
>  1313			 * jiffies value.
>  1314			 */
>  1315			start = READ_ONCE(jiffies);
>  1316			barrier();
>  1317	
>  1318			/*
>  1319			 * Here we take off tsk->signal->cpu_timers[N] and
>  1320			 * tsk->cpu_timers[N] all the timers that are firing, and
>  1321			 * put them on the firing list.
>  1322			 */
>  1323			check_thread_timers(tsk, &firing);
>  1324	
>  1325			check_process_timers(tsk, &firing);
>  1326	
>  1327			/*
>  1328			 * The above timer checks have updated the expiry cache and
>  1329			 * because nothing can have queued or modified timers after
>  1330			 * sighand lock was taken above it is guaranteed to be
>  1331			 * consistent. So the next timer interrupt fastpath check
>  1332			 * will find valid data.
>  1333			 *
>  1334			 * If timer expiry runs in the timer interrupt context then
>  1335			 * the loop is not relevant as timers will be directly
>  1336			 * expired in interrupt context. The stub function below
>  1337			 * returns always true which allows the compiler to
>  1338			 * optimize the loop out.
>  1339			 *
>  1340			 * If timer expiry is deferred to task work context then
>  1341			 * the following rules apply:
>  1342			 *
>  1343			 * - On !RT kernels no tick can have happened on this CPU
>  1344			 *   after sighand lock was acquired because interrupts are
>  1345			 *   disabled. So reenabling task work before dropping
>  1346			 *   sighand lock and reenabling interrupts is race free.
>  1347			 *
>  1348			 * - On RT kernels ticks might have happened but the tick
>  1349			 *   work ignored posix CPU timer handling because the
>  1350			 *   CPUTIMERS_WORK_SCHEDULED bit is set. Reenabling work
>  1351			 *   must be done very carefully including a check whether
>  1352			 *   ticks have happened since the start of the timer
>  1353			 *   expiry checks. posix_cpu_timers_enable_work() takes
>  1354			 *   care of that and eventually lets the expiry checks
>  1355			 *   run again.
>  1356			 */
>  1357		} while (!posix_cpu_timers_enable_work(tsk, start));
>  1358	
>  1359		/*
>  1360		 * We must release sighand lock before taking any timer's lock.
>  1361		 * There is a potential race with timer deletion here, as the
>  1362		 * siglock now protects our private firing list.  We have set
>  1363		 * the firing flag in each timer, so that a deletion attempt
>  1364		 * that gets the timer lock before we do will give it up and
>  1365		 * spin until we've taken care of that timer below.
>  1366		 */
>  1367		spin_unlock_irqrestore(&tsk->sighand->siglock, flags);
>  1368	
>  1369		/*
>  1370		 * Now that all the timers on our list have the firing flag,
>  1371		 * no one will touch their list entries but us.  We'll take
>  1372		 * each timer's lock before clearing its firing flag, so no
>  1373		 * timer call will interfere.
>  1374		 */
>  1375		list_for_each_entry_safe(timer, next, &firing, it.cpu.elist) {
>  1376			bool cpu_firing;
>  1377	
>  1378			/*
>  1379			 * spin_lock() is sufficient here even independent of the
>  1380			 * expiry context. If expiry happens in hard interrupt
>  1381			 * context it's obvious. For task work context it's safe
>  1382			 * because all other operations on timer::it_lock happen in
>  1383			 * task context (syscall or exit).
>  1384			 */
>  1385			spin_lock(&timer->it_lock);
>  1386			list_del_init(&timer->it.cpu.elist);
>  1387			cpu_firing = timer->it.cpu.firing;
>  1388			timer->it.cpu.firing = false;
>  1389			/*
>  1390			 * If the firing flag is cleared then this raced with a
>  1391			 * timer rearm/delete operation. So don't generate an
>  1392			 * event.
>  1393			 */
>  1394			if (likely(cpu_firing))
>  1395				cpu_timer_fire(timer);
>  1396			/* See posix_cpu_timer_wait_running() */
>  1397			rcu_assign_pointer(timer->it.cpu.handling, NULL);
>  1398			spin_unlock(&timer->it_lock);
>  1399		}
>  1400	}
>  1401	
>
>--
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki
>


Oleg already addressed to something like  this, I think he said to nuke
__rcu, which idm looking at and submitting.

Thanks!
