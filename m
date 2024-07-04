Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5B6171A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 03:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720065080; cv=none; b=Ik8xzsCYRSI/lJFzlDNPBRiErR7Wtma2JCa7GzcRjoGUxkfGJxRVMqPIUd8/KC7VNIdPb74cAyOreu4RBjA14Xj2rlVlrGeGmQh5eTDGraDti8FHvqfoFhxD3WE4H1kO4h5nLn3LgpXJPQXLYJ1anxAJbZCfD5vGAozmj5fCAvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720065080; c=relaxed/simple;
	bh=aHPJDKtwcn3tykeDTM6Fa7/HnplsO9w6CYb/PRGykSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0Vu2LsnCcdmNxQONneGpPcscUEwwNAok6dY6sthEhNaH9wRBCiavox1sWiu+ZBC3EQNzJhIudqCp2DbUHcYNZ4E5ij69sSLRGM5W+XmlkiqVxzGct82NnTorEKVSNorZWf8eUr8c8T0Y10FW6R5sc8Qg+XdT28Vy+EPNml4ScA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqBAyOG8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqBAyOG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720065078; x=1751601078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aHPJDKtwcn3tykeDTM6Fa7/HnplsO9w6CYb/PRGykSM=;
  b=hqBAyOG8+4+sS8Oh3A43ev1g2wFxkKN0YynUcK6uUEnCM/StdjdEeJty
   B4BznEN0hCAnLxmxkSwpgEn8Pkw7SeoT/ZEiO03prTOK/IKXYbKLW5SqA
   iGWvW0h4NQaa5Z8EMsw4+9usTOnMeI6NL8icBqG3hJnsvfXz0OlprMdk4
   HSKADfcjMItAbMt3r3ycCWwuKEeBLfCpMv2QTanCu5OPQyVKt6p1+ju9i
   pm2XIgsoLSaTcAHEpqcJkTUDQ41GhL47JOnJe8GFgwHkzQDOlojqRgUrq
   hEqEB1JwW3+fRI2ClJlI/5ACl5Tl7l/6SXXtL6ihwf2fffgEEuML09i+F
   w==;
X-CSE-ConnectionGUID: /QcSO7zBSHmp6A14twyymQ==
X-CSE-MsgGUID: /1nsEgNBSb+VrVRk1deH2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="27939978"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="27939978"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:51:18 -0700
X-CSE-ConnectionGUID: UKW19AJZS/6es3D7fMz2ZQ==
X-CSE-MsgGUID: HAdPUATJSGygV7ygZiV1iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51417529"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2024 20:51:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPDV4-000QWI-1m;
	Thu, 04 Jul 2024 03:51:14 +0000
Date: Thu, 4 Jul 2024 11:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 31/49] include/linux/llist.h:248:undefined reference
 to `csd_lock_is_stuck'
Message-ID: <202407041118.erfQIPG6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   98800981bc4f02066887d7f0bd41cb7070fbcc94
commit: c19a6725b01918d24073ac60c4f08d49723c8e8f [31/49] rcu: Extract synchronize_rcu_expedited_stall() from synchronize_rcu_expedited_wait()
config: riscv-randconfig-r123-20240131 (https://download.01.org/0day-ci/archive/20240704/202407041118.erfQIPG6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041118.erfQIPG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041118.erfQIPG6-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/rcu/tree.o: in function `llist_add':
>> include/linux/llist.h:248:(.text+0x9398): undefined reference to `csd_lock_is_stuck'


vim +248 include/linux/llist.h

476c5818c37a78 Peter Zijlstra 2020-08-29  238  
1230db8e1543c0 Huang Ying     2011-09-08  239  /**
1230db8e1543c0 Huang Ying     2011-09-08  240   * llist_add - add a new entry
1230db8e1543c0 Huang Ying     2011-09-08  241   * @new:	new entry to be added
1230db8e1543c0 Huang Ying     2011-09-08  242   * @head:	the head for your lock-less list
781f7fd916fc77 Huang Ying     2011-09-08  243   *
fc23af34b00ef4 Andrew Morton  2011-10-31  244   * Returns true if the list was empty prior to adding this entry.
1230db8e1543c0 Huang Ying     2011-09-08  245   */
781f7fd916fc77 Huang Ying     2011-09-08  246  static inline bool llist_add(struct llist_node *new, struct llist_head *head)
1230db8e1543c0 Huang Ying     2011-09-08  247  {
e9a17bd73a29e5 Oleg Nesterov  2013-07-08 @248  	return llist_add_batch(new, new, head);
1230db8e1543c0 Huang Ying     2011-09-08  249  }
1230db8e1543c0 Huang Ying     2011-09-08  250  

:::::: The code at line 248 was first introduced by commit
:::::: e9a17bd73a29e5323c37ec5ffe50fc0e825d3d03 llist: llist_add() can use llist_add_batch()

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
