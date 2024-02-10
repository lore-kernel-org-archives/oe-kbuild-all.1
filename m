Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCB92E3E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707558616; cv=none; b=nhp4RjI5gaghBtkoj8QjfRpb0nE2tPpp5Frb0VBhlHmHAqL3BICFV29cgolAexEdeuatrY75N6C9qilM08I/akk1yY4JhFDRlgwL6YXKMrY4ZR0Vi+spxwVChXVVXV6rR3R2xxTV0vZ/Vv9JOsSK+b2WkomDVkI3Z5dX/hOeNX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707558616; c=relaxed/simple;
	bh=u+vPXOlt3qiDe6NTiI/N/7MzyXkMpUQjH86JmRP7EJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rtljJjN0L6oIgAdvqlv2jC2FAcsKFCHdhZYyrQs3UOhdL8RoAWLN+qhNoQGJ8hyYRVgaU299wm6shLQbuIrzNgBni1sgOXTtF8aK8X5MO6w6MG99VswI3h6yg92w5LYXR2VPYyAhtUq5nCMOTrzm77VhpSHulLcqWbIj8Dig/PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpCi+/iM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpCi+/iM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707558614; x=1739094614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u+vPXOlt3qiDe6NTiI/N/7MzyXkMpUQjH86JmRP7EJs=;
  b=EpCi+/iMw7G0kuxI5P1hioj2zRNVM+kHMEfWKX03hcVO92t5L+kcHeXf
   zovCLa8w7SptBooyW3XCXYHJ5pxQQ/OibQlVhMwYTmvVRaFXBlLhcAnbl
   DLL18xecF3eBq7i8ZtJ7+i9s/CbfLp6OHGcWUL1nGabFtgIBW8gAWBVTM
   C6V8O45Ey5wMY+YWIlY9pBKHtSig4e4SljjIzCHv9k377FA+utGoaxys3
   CidsBa7uq9QIYaa5lbClHIOoDUyhZYQXdN16nZ58C4st6SvZcn9PiIARH
   UDw12WyAIE3hiFDU1ymZX7eZn7rBNs7lwKBV0drjNS6g1i6uRlR1cpxwW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12639060"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="12639060"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 01:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="32933230"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Feb 2024 01:50:12 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYjzt-0005Y2-0l;
	Sat, 10 Feb 2024 09:50:09 +0000
Date: Sat, 10 Feb 2024 17:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [frederic-dynticks:timers/anna 27/29]
 kernel/time/timer_migration.c:717:14: warning: variable 'leftmost_change'
 set but not used
Message-ID: <202402101746.vJfo8hcm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/anna
head:   9a654aebd02182bcaff7e5a26b632ee20a1536ad
commit: e1d95a0b5e081b068c5f89cd3b4240a00401118a [27/29] cleanup update_event
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240210/202402101746.vJfo8hcm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101746.vJfo8hcm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101746.vJfo8hcm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/timer_migration.c: In function 'tmigr_update_events':
>> kernel/time/timer_migration.c:717:14: warning: variable 'leftmost_change' set but not used [-Wunused-but-set-variable]
     717 |         bool leftmost_change = false;
         |              ^~~~~~~~~~~~~~~


vim +/leftmost_change +717 kernel/time/timer_migration.c

0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  696  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  697  /*
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  698   * Returns true, if there is nothing to be propagated to the next level
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  699   *
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  700   * @data->firstexp is set to expiry of first gobal event of the (top level of
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  701   * the) hierarchy, but only when hierarchy is completely idle.
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  702   *
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  703   * When reread_state is set, childstate and groupstate are handed in as 0. The
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  704   * state has to be reread under the lock, to prevent a race against a concurrent
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  705   * tmigr_inactive_up() run when the last CPU goes idle. See also section
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  706   * "Prevent race between new event and last CPU going inactive" in the
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  707   * documentation at the top.
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  708   *
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  709   * This is the only place where the group event expiry value is set.
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  710   */
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  711  static
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  712  bool tmigr_update_events(struct tmigr_group *group, struct tmigr_group *child,
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  713  			 struct tmigr_walk *data, union tmigr_state childstate,
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  714  			 union tmigr_state groupstate, bool reread_state)
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  715  {
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  716  	struct tmigr_event *evt, *first_childevt;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09 @717  	bool leftmost_change = false;
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  718  	bool remote = data->remote;
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  719  	bool walk_done = false;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  720  	u64 nextexp;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  721  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  722  	if (child) {
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  723  		raw_spin_lock(&child->lock);
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  724  		raw_spin_lock_nested(&group->lock, SINGLE_DEPTH_NESTING);
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  725  
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  726  		if (reread_state) {
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  727  			groupstate.state = atomic_read(&group->migr_state);
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  728  			childstate.state = atomic_read(&child->migr_state);
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  729  		}
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  730  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  731  		if (childstate.active) {
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  732  			walk_done = true;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  733  			goto unlock;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  734  		}
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  735  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  736  		first_childevt = tmigr_next_groupevt(child);
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  737  		nextexp = child->next_expiry;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  738  		evt = &child->groupevt;
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  739  
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  740  		evt->ignore = (nextexp == KTIME_MAX) ? true : false;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  741  	} else {
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  742  		nextexp = data->nextexp;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  743  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  744  		first_childevt = evt = data->evt;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  745  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  746  		/*
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  747  		 * Walking the hierarchy is required in any case when a
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  748  		 * remote expiry was done before. This ensures to not lose
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  749  		 * already queued events in non active groups (see section
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  750  		 * "Required event and timerqueue update after a remote
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  751  		 * expiry" in the documentation at the top).
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  752  		 *
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  753  		 * The two call sites which are executed without a remote expiry
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  754  		 * before, are not prevented from propagating changes through
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  755  		 * the hierarchy by the return:
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  756  		 *  - When entering this path by tmigr_new_timer(), @evt->ignore
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  757  		 *    is never set.
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  758  		 *  - tmigr_inactive_up() takes care of the propagation by
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  759  		 *    itself and ignores the return value. But an immediate
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  760  		 *    return is required because nothing has to be done in this
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  761  		 *    level as the event could be ignored.
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  762  		 */
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  763  		if (evt->ignore && !remote)
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  764  			return true;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  765  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  766  		raw_spin_lock(&group->lock);
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  767  
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  768  		if (reread_state)
aa09e3c6d2ed53 Anna-Maria Behnsen 2024-02-09  769  			groupstate.state = atomic_read(&group->migr_state);
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  770  	}
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  771  
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  772  	/*
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  773  	 * If the child event is already queued in the group, remove it from the
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  774  	 * queue when the expiry time changed only or when it could be ignored.
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  775  	 */
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  776  	if (timerqueue_node_queued(&evt->nextevt)) {
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  777  		if ((evt->nextevt.expires == nextexp) && !evt->ignore)
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  778  			goto check_toplvl;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  779  
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  780  		leftmost_change = timerqueue_getnext(&group->events) == &evt->nextevt;
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  781  		if (!timerqueue_del(&group->events, &evt->nextevt))
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  782  			WRITE_ONCE(group->next_expiry, KTIME_MAX);
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  783  	}
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  784  
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  785  	if (evt->ignore) {
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  786  		/*
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  787  		 * When the next child event could be ignored (nextexp is
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  788  		 * KTIME_MAX) and there was no remote timer handling before or
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  789  		 * the group is already active, there is no need to walk the
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  790  		 * hierarchy even if there is a parent group.
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  791  		 *
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  792  		 * The other way round: even if the event could be ignored, but
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  793  		 * if a remote timer handling was executed before and the group
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  794  		 * is not active, walking the hierarchy is required to not miss
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  795  		 * an enqueued timer in the non active group. The enqueued timer
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  796  		 * of the group needs to be propagated to a higher level to
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  797  		 * ensure it is handled.
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  798  		 */
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  799  		if (!remote || groupstate.active)
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  800  			walk_done = true;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  801  	} else {
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  802  		evt->nextevt.expires = nextexp;
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  803  		evt->cpu = first_childevt->cpu;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  804  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  805  		if (timerqueue_add(&group->events, &evt->nextevt)) {
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  806  			leftmost_change = true;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  807  			WRITE_ONCE(group->next_expiry, nextexp);
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  808  		}
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  809  	}
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  810  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  811  check_toplvl:
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  812  	if (!group->parent && (groupstate.migrator == TMIGR_NONE)) {
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  813  		walk_done = true;
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  814  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  815  		/*
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  816  		 * Nothing to do when update was done during remote timer
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  817  		 * handling. First timer in top level group which needs to be
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  818  		 * handled when top level group is not active, is calculated
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  819  		 * directly in tmigr_handle_remote_up().
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  820  		 */
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  821  		if (remote)
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  822  			goto unlock;
e1d95a0b5e081b Anna-Maria Behnsen 2024-02-09  823  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  824  		/*
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  825  		 * The top level group is idle and it has to be ensured the
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  826  		 * global timers are handled in time. (This could be optimized
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  827  		 * by keeping track of the last global scheduled event and only
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  828  		 * arming it on the CPU if the new event is earlier. Not sure if
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  829  		 * its worth the complexity.)
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  830  		 */
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  831  		data->firstexp = tmigr_next_groupevt_expires(group);
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  832  	}
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  833  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  834  unlock:
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  835  	raw_spin_unlock(&group->lock);
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  836  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  837  	if (child)
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  838  		raw_spin_unlock(&child->lock);
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  839  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  840  	return walk_done;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  841  }
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  842  

:::::: The code at line 717 was first introduced by commit
:::::: 0a3bafadcf1c9d0de98b840e6e906e8f86167a12 timers: Implement the hierarchical pull model

:::::: TO: Anna-Maria Behnsen <anna-maria@linutronix.de>
:::::: CC: Frederic Weisbecker <frederic@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
