Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114351A8F6D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 23:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739920584; cv=none; b=A5EZtx7SITKpu07IvhiCv2bwWZKHB4iGBgUhpG8OEOGjQW6UTK2tTI2IavKwKwUFAVysjz+kJSqBM/1cgpQYLMy2yIQLfmmTaFAKbwjrMrdDkgiazK+8OlvpewR6SGOrPzNxoRl8/XqB/0GhT0OPvs8Jklw+6GUl12D0NTjH37k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739920584; c=relaxed/simple;
	bh=ekCiZ4bX0FI6Pcd99y8JaLk9Qc9u2X/FB2cAdSTl+OY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDF5ALvxl8eGaGXih2zLUfAhWwwp1lpWh5ZRv9oFR5rtoIL82TaOLug27Ic9ELIdDqPYMMJGjypzH/YURfo0fFCS0haE2SQhn0qu0982S8Q2C/PUz2MFh3dkEtI5wQrtWgGLqeK1wYpHB0UgjN8+ZKSIa014pqA+T8NUnhSYreo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEbnSvc2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEbnSvc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739920582; x=1771456582;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ekCiZ4bX0FI6Pcd99y8JaLk9Qc9u2X/FB2cAdSTl+OY=;
  b=YEbnSvc2mlHWWw7BgWC2ond+2ixfV41ECMNixR71fE9UCr+4pKQoZ90p
   O3IQ93PN2YvlOEkUDuRMPt2VGCT79AqpoxNa1ffvBzl7VP8KzogDwGdKk
   W6ohROiM0kLTB3NsTq+mZEG9CtOR0ySU0QQymoBzjvr/Lr3zHYtit+thH
   hdi2+I3qw4rHScl3A/3eBDaJq0L52D2GVQ7swRr2v+7kDHblrrxOeWiIJ
   lekKK5MU9cs6UPlbc6v7u7ZegXF+MFNpZ6HbbpIyNuwHG6b7bq3O8vaUt
   PdI4AQoSlchqyoqd1FqLXYXKuNHoKfT3aEbW0eqE0MuEGbNxnm0s60Js2
   A==;
X-CSE-ConnectionGUID: XyCjXNb8Ro6qH2YEK4ol0g==
X-CSE-MsgGUID: aELKcki2SQGiugmGKtN8vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51624037"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="51624037"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 15:16:21 -0800
X-CSE-ConnectionGUID: mKkEFXu2Rc+oJixb3xf/ug==
X-CSE-MsgGUID: 29UQbr1ETAG4zleuNXGnFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="119648942"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Feb 2025 15:16:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkWp8-0000xR-1c
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 23:16:18 +0000
Date: Wed, 19 Feb 2025 07:15:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] fs/eventpoll.c:1672: Error: unrecognized
 opcode `csrs sstatus,s10', extension `zicsr' required
Message-ID: <202502190725.o1vjuVib-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 4e0982a00564c80cb849a892043450860ef91e14 [1/1] fs/epoll: simplify ep_send_events_proc() ready-list loop
config: riscv-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190725.o1vjuVib-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190725.o1vjuVib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190725.o1vjuVib-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/eventpoll.c: Assembler messages:
>> fs/eventpoll.c:1672: Error: unrecognized opcode `csrs sstatus,s10', extension `zicsr' required
>> fs/eventpoll.c:1672: Error: unrecognized opcode `csrc sstatus,s10', extension `zicsr' required
   fs/eventpoll.c:1673: Error: unrecognized opcode `csrs sstatus,s10', extension `zicsr' required
   fs/eventpoll.c:1673: Error: unrecognized opcode `csrc sstatus,s10', extension `zicsr' required


vim +1672 fs/eventpoll.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1621  
d85e2aa2e34dac Al Viro         2018-02-01  1622  static __poll_t ep_send_events_proc(struct eventpoll *ep, struct list_head *head,
296e236e96ddde Davide Libenzi  2009-03-31  1623  			       void *priv)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1624  {
5071f97ec6d74f Davide Libenzi  2009-03-31  1625  	struct ep_send_events_data *esed = priv;
d85e2aa2e34dac Al Viro         2018-02-01  1626  	__poll_t revents;
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1627  	struct epitem *epi, *tmp;
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1628  	struct epoll_event __user *uevent = esed->events;
eea1d585917c53 Eric Wong       2013-04-30  1629  	struct wakeup_source *ws;
626cf236608505 Hans Verkuil    2012-03-23  1630  	poll_table pt;
626cf236608505 Hans Verkuil    2012-03-23  1631  
626cf236608505 Hans Verkuil    2012-03-23  1632  	init_poll_funcptr(&pt, NULL);
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1633  	esed->res = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1634  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1635  	/*
5071f97ec6d74f Davide Libenzi  2009-03-31  1636  	 * We can loop without lock because we are passed a task private list.
5071f97ec6d74f Davide Libenzi  2009-03-31  1637  	 * Items cannot vanish during the loop because ep_scan_ready_list() is
5071f97ec6d74f Davide Libenzi  2009-03-31  1638  	 * holding "mtx" during this call.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1639  	 */
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1640  	list_for_each_entry_safe(epi, tmp, head, rdllink) {
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1641  		if (esed->res >= esed->maxevents)
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1642  			break;
d47de16c722196 Davide Libenzi  2007-05-15  1643  
4d7e30d98939a0 Arve Hjønnevåg  2012-05-01  1644  		/*
4d7e30d98939a0 Arve Hjønnevåg  2012-05-01  1645  		 * Activate ep->ws before deactivating epi->ws to prevent
4d7e30d98939a0 Arve Hjønnevåg  2012-05-01  1646  		 * triggering auto-suspend here (in case we reactive epi->ws
4d7e30d98939a0 Arve Hjønnevåg  2012-05-01  1647  		 * below).
4d7e30d98939a0 Arve Hjønnevåg  2012-05-01  1648  		 *
4d7e30d98939a0 Arve Hjønnevåg  2012-05-01  1649  		 * This could be rearranged to delay the deactivation of epi->ws
4d7e30d98939a0 Arve Hjønnevåg  2012-05-01  1650  		 * instead, but then epi->ws would temporarily be out of sync
4d7e30d98939a0 Arve Hjønnevåg  2012-05-01  1651  		 * with ep_is_linked().
4d7e30d98939a0 Arve Hjønnevåg  2012-05-01  1652  		 */
eea1d585917c53 Eric Wong       2013-04-30  1653  		ws = ep_wakeup_source(epi);
eea1d585917c53 Eric Wong       2013-04-30  1654  		if (ws) {
eea1d585917c53 Eric Wong       2013-04-30  1655  			if (ws->active)
4d7e30d98939a0 Arve Hjønnevåg  2012-05-01  1656  				__pm_stay_awake(ep->ws);
eea1d585917c53 Eric Wong       2013-04-30  1657  			__pm_relax(ws);
eea1d585917c53 Eric Wong       2013-04-30  1658  		}
eea1d585917c53 Eric Wong       2013-04-30  1659  
d47de16c722196 Davide Libenzi  2007-05-15  1660  		list_del_init(&epi->rdllink);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1661  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1662  		/*
5071f97ec6d74f Davide Libenzi  2009-03-31  1663  		 * If the event mask intersect the caller-requested one,
5071f97ec6d74f Davide Libenzi  2009-03-31  1664  		 * deliver the event to userspace. Again, ep_scan_ready_list()
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1665  		 * is holding ep->mtx, so no operations coming from userspace
5071f97ec6d74f Davide Libenzi  2009-03-31  1666  		 * can change the item.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1667  		 */
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1668  		revents = ep_item_poll(epi, &pt, 1);
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1669  		if (!revents)
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1670  			continue;
4e0982a00564c8 Davidlohr Bueso 2019-01-03  1671  
5071f97ec6d74f Davide Libenzi  2009-03-31 @1672  		if (__put_user(revents, &uevent->events) ||
d0305882825784 Tony Battersby  2009-03-31  1673  		    __put_user(epi->event.data, &uevent->data)) {
d0305882825784 Tony Battersby  2009-03-31  1674  			list_add(&epi->rdllink, head);
eea1d585917c53 Eric Wong       2013-04-30  1675  			ep_pm_stay_awake(epi);
d7ebbe46f445d8 Al Viro         2018-02-01  1676  			if (!esed->res)
d7ebbe46f445d8 Al Viro         2018-02-01  1677  				esed->res = -EFAULT;
d7ebbe46f445d8 Al Viro         2018-02-01  1678  			return 0;
d0305882825784 Tony Battersby  2009-03-31  1679  		}
d7ebbe46f445d8 Al Viro         2018-02-01  1680  		esed->res++;
5071f97ec6d74f Davide Libenzi  2009-03-31  1681  		uevent++;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1682  		if (epi->event.events & EPOLLONESHOT)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1683  			epi->event.events &= EP_PRIVATE_BITS;
296e236e96ddde Davide Libenzi  2009-03-31  1684  		else if (!(epi->event.events & EPOLLET)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1685  			/*
296e236e96ddde Davide Libenzi  2009-03-31  1686  			 * If this file has been added with Level
296e236e96ddde Davide Libenzi  2009-03-31  1687  			 * Trigger mode, we need to insert back inside
296e236e96ddde Davide Libenzi  2009-03-31  1688  			 * the ready list, so that the next call to
296e236e96ddde Davide Libenzi  2009-03-31  1689  			 * epoll_wait() will check again the events
296e236e96ddde Davide Libenzi  2009-03-31  1690  			 * availability. At this point, no one can insert
296e236e96ddde Davide Libenzi  2009-03-31  1691  			 * into ep->rdllist besides us. The epoll_ctl()
296e236e96ddde Davide Libenzi  2009-03-31  1692  			 * callers are locked out by
296e236e96ddde Davide Libenzi  2009-03-31  1693  			 * ep_scan_ready_list() holding "mtx" and the
296e236e96ddde Davide Libenzi  2009-03-31  1694  			 * poll callback will queue them in ep->ovflist.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1695  			 */
d47de16c722196 Davide Libenzi  2007-05-15  1696  			list_add_tail(&epi->rdllink, &ep->rdllist);
eea1d585917c53 Eric Wong       2013-04-30  1697  			ep_pm_stay_awake(epi);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1698  		}
9ce209d64d820a Davide Libenzi  2008-10-17  1699  	}
6192bd536f96c6 Davide Libenzi  2007-05-08  1700  
d7ebbe46f445d8 Al Viro         2018-02-01  1701  	return 0;
6192bd536f96c6 Davide Libenzi  2007-05-08  1702  }
d47de16c722196 Davide Libenzi  2007-05-15  1703  

:::::: The code at line 1672 was first introduced by commit
:::::: 5071f97ec6d74f006072de0ce89b67c8792fe5a1 epoll: fix epoll's own poll

:::::: TO: Davide Libenzi <davidel@xmailserver.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
