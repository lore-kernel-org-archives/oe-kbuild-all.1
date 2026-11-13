Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612183;
	b=EheCE1bOyiww6MA2oefHimAINEmBk0XoCKyN47m/fwVghNPWDMubfsvyVjm5qknrLkBJ
	 JpFstv0i5Do4GJPPXmPpZ26EOyQNtnB9jxKiJUiH04w9aSf6DqO1zsfd/sZbMe/rOPptK
	 d2z4c5xfk5Z0+ZYBnvnV03+4UK6+rgUmbdl9v7d8EC6A+MIgpt7RlXucCt11oFixiLUy4
	 MV0mPNeBHQJyeS4Y6C5u10PnboWvSsKDV/kyk5XYPKxTU6ikN+jF7hE3dvVfQlK5fgk1m
	 hF1508Js7qujcznVPvw+Akt1+PLp6azEpKKxJZzj13EcZ1jpi261mbh/8SIXYXe3uYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612183;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KFJZRbysM2Gfa0R5nyYBklImeJdrgVaKDzZ7/AKskiA=;
	b=p5EDOw0qRu7kbSURar4sSgD/piQRRJ+Tw0v2CTS2lZf3T2Mmg0IRlSIUX8qydWV4ZRFi
	 BheMdxL6fyLG1PHftUYM+zo+sleUHJr3kf3mlyWwknqy5edcDcldGke9GGQkITfsp9mMO
	 trLWOawbOKDuitlchpAhELbSqguxzsZGpJAFZG5DgLGGIDdWIAXWlc/VRil181GKplbP/
	 0E9T/7HaKVyDIqYcg29xZS1QhK/nCuD6acdGh+X3wv0pc4VXTkPdRCakIg1aNbIuJfDpy
	 kdcorH++h7QX0Oz9PNAXDVRUqxc1biXGOdHsbpXTS9dgxMoKOdmisaxWK6Gz2I5mArA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nfSWtPRa;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875C4606A8A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 23:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 875C4606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nfSWtPRa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794612179; x=1826148179;
  h=date:from:to:cc:subject:message-id;
  bh=xlCKOwbYVhzIKLXGaR/XlI7XUaluE2OGiocFl9Hf+eI=;
  b=nfSWtPRaQszHsmrlFJQJkIKejHcR2+JZw9Hw8kfpqCAIdpU0xzM6osCG
   D+uE01y4YQIhPx3v2tIAvclJnqMAXA+2iuHlVJc/4pL4sHtYpJf6bYUk8
   32O3VqopJwoKNn07W9/t3VtUh51UVUVPSF/IZqXRjPFE79WCHG3w7hIyQ
   K4oXQUb8satJRmJwgZ+MfYhw5eU+xr3aA2+zl+QVlkRdglag5q56n7CVl
   msyleLjGBsDeDvGvoLDGtBbOoJGcxZ3kADaiXLVQ3qL3LpHMYiGpyvfrN
   /zYddhNM+lnhXiW9B3L9QgWpOZmQiIcOOVamb+wLwWCZwMKrsnTFSwfzj
   w==;
X-CSE-ConnectionGUID: SWBwpm9ITjuNE7OrERvySQ==
X-CSE-MsgGUID: BnCMy8VdQbyPGhJ2OvCFsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3324901"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3324901"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 15:22:59 -0800
X-CSE-ConnectionGUID: bVmcktVvRJKdnI/kYjbbYw==
X-CSE-MsgGUID: +byfLKhmQ3SuHV65N6j/JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8872198"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2026 15:22:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS0bf-000000001P1-2wPw;
	Fri, 13 Nov 2026 23:22:55 +0000
Date: Sat, 14 Nov 2026 00:22:36 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify_group_type 20/26]
 fs/notify/fanotify/fanotify.c:1014:9: sparse: sparse: cast truncates bits
 from constant value (101000000 becomes 1000000)
Message-ID: <202611140019.Jzk7MaNl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/amir73il/linux fsnotify_group_type
head:   a9e647af5bf1c08af70a0c407ad1733c91c85ac4
commit: d4051f4236095085215df08481d4c1f9920c3fbd [20/26] fanotify: define new FAN_NS_MNT_* constants
config: openrisc-randconfig-r2305-20261113 (https://download.01.org/0day-ci/archive/20261114/202611140019.Jzk7MaNl-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140019.Jzk7MaNl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140019.Jzk7MaNl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/notify/fanotify/fanotify.c:1170:27: sparse: sparse: symbol 'fanotify_fsnotify_ops' was not declared. Should it be static?
>> fs/notify/fanotify/fanotify.c:1014:9: sparse: sparse: cast truncates bits from constant value (101000000 becomes 1000000)
   fs/notify/fanotify/fanotify.c:1015:9: sparse: sparse: cast truncates bits from constant value (102000000 becomes 2000000)

vim +1014 fs/notify/fanotify/fanotify.c

   965	
   966	#define ASSERT_FS_EVENT(fan_mask, fsn_mask) \
   967		BUILD_BUG_ON((u32)(fan_mask) != (fsn_mask) || \
   968			     FAN_EVENT_TYPE(fan_mask) != FSNOTIFY_GROUP_TYPE_FILESYSTEM)
   969	#define ASSERT_NAMESPACE_EVENT(fan_mask, fsn_mask) \
   970		BUILD_BUG_ON((u32)(fan_mask) != (fsn_mask) || \
   971			     FAN_EVENT_TYPE(fan_mask) != FSNOTIFY_GROUP_TYPE_NAMESPACE)
   972	
   973	static int fanotify_handle_event(struct fsnotify_group *group, u32 mask,
   974					 const void *data, int data_type,
   975					 struct inode *dir,
   976					 const struct qstr *file_name, u32 cookie,
   977					 struct fsnotify_iter_info *iter_info)
   978	{
   979		int ret = 0;
   980		struct fanotify_event *event;
   981		struct fsnotify_event *fsn_event;
   982		__kernel_fsid_t fsid = {};
   983		u32 match_mask = 0;
   984		bool is_perm_event = fsnotify_is_filesystem_watcher(group) &&
   985				     (mask & FANOTIFY_PERM_EVENTS);
   986	
   987		/* Assert "strong typed" events for filesystem watcher */
   988		ASSERT_FS_EVENT(FAN_ACCESS, FS_ACCESS);
   989		ASSERT_FS_EVENT(FAN_MODIFY, FS_MODIFY);
   990		ASSERT_FS_EVENT(FAN_ATTRIB, FS_ATTRIB);
   991		ASSERT_FS_EVENT(FAN_CLOSE_NOWRITE, FS_CLOSE_NOWRITE);
   992		ASSERT_FS_EVENT(FAN_CLOSE_WRITE, FS_CLOSE_WRITE);
   993		ASSERT_FS_EVENT(FAN_OPEN, FS_OPEN);
   994		ASSERT_FS_EVENT(FAN_MOVED_TO, FS_MOVED_TO);
   995		ASSERT_FS_EVENT(FAN_MOVED_FROM, FS_MOVED_FROM);
   996		ASSERT_FS_EVENT(FAN_CREATE, FS_CREATE);
   997		ASSERT_FS_EVENT(FAN_DELETE, FS_DELETE);
   998		ASSERT_FS_EVENT(FAN_DELETE_SELF, FS_DELETE_SELF);
   999		ASSERT_FS_EVENT(FAN_MOVE_SELF, FS_MOVE_SELF);
  1000		ASSERT_FS_EVENT(FAN_EVENT_ON_CHILD, FS_EVENT_ON_CHILD);
  1001		ASSERT_FS_EVENT(FAN_Q_OVERFLOW, FS_Q_OVERFLOW);
  1002		ASSERT_FS_EVENT(FAN_OPEN_PERM, FS_OPEN_PERM);
  1003		ASSERT_FS_EVENT(FAN_ACCESS_PERM, FS_ACCESS_PERM);
  1004		ASSERT_FS_EVENT(FAN_ONDIR, FS_ISDIR);
  1005		ASSERT_FS_EVENT(FAN_OPEN_EXEC, FS_OPEN_EXEC);
  1006		ASSERT_FS_EVENT(FAN_OPEN_EXEC_PERM, FS_OPEN_EXEC_PERM);
  1007		ASSERT_FS_EVENT(FAN_FS_ERROR, FS_ERROR);
  1008		ASSERT_FS_EVENT(FAN_RENAME, FS_RENAME);
  1009		ASSERT_FS_EVENT(FAN_PRE_ACCESS, FS_PRE_ACCESS);
  1010		/* Assert backward compat mount events */
  1011		ASSERT_FS_EVENT(FAN_MNT_ATTACH, FSN_MNT_ATTACH);
  1012		ASSERT_FS_EVENT(FAN_MNT_DETACH, FSN_MNT_DETACH);
  1013		/* Assert "strong typed" events for namespace watcher */
> 1014		ASSERT_NAMESPACE_EVENT(FAN_NS_MNT_ATTACH, FSN_MNT_ATTACH);
  1015		ASSERT_NAMESPACE_EVENT(FAN_NS_MNT_DETACH, FSN_MNT_DETACH);
  1016	
  1017		BUILD_BUG_ON(HWEIGHT64(ALL_FANOTIFY_EVENT_BITS) != 25);
  1018	
  1019		mask = fanotify_group_event_mask(group, iter_info, &match_mask,
  1020						 mask, data, data_type, dir);
  1021		if (!mask)
  1022			return 0;
  1023	
  1024		pr_debug("%s: group=%p type=%d mask=%x report_mask=%x\n", __func__,
  1025			 group, group->type, mask, match_mask);
  1026	
  1027		if (is_perm_event) {
  1028			/*
  1029			 * fsnotify_prepare_user_wait() fails if we race with mark
  1030			 * deletion.  Just let the operation pass in that case.
  1031			 */
  1032			if (!fsnotify_prepare_user_wait(iter_info))
  1033				return 0;
  1034		}
  1035	
  1036		if (FAN_GROUP_FLAG(group, FANOTIFY_FID_BITS))
  1037			fsid = fanotify_get_fsid(iter_info);
  1038	
  1039		event = fanotify_alloc_event(group, mask, data, data_type, dir,
  1040					     file_name, &fsid, match_mask);
  1041		ret = -ENOMEM;
  1042		if (unlikely(!event)) {
  1043			/*
  1044			 * We don't queue overflow events for permission events as
  1045			 * there the access is denied and so no event is in fact lost.
  1046			 */
  1047			if (!is_perm_event)
  1048				fsnotify_queue_overflow(group);
  1049			goto finish;
  1050		}
  1051	
  1052		fsn_event = &event->fse;
  1053		ret = fsnotify_insert_event(group, fsn_event, fanotify_merge,
  1054					    fanotify_insert_event);
  1055		if (ret) {
  1056			/* Permission events shouldn't be merged */
  1057			WARN_ON(ret == 1 && is_perm_event);
  1058			/* Our event wasn't used in the end. Free it. */
  1059			fsnotify_destroy_event(group, fsn_event);
  1060	
  1061			ret = 0;
  1062		} else if (is_perm_event) {
  1063			ret = fanotify_get_response(group, FANOTIFY_PERM(event),
  1064						    iter_info);
  1065		}
  1066	finish:
  1067		if (is_perm_event)
  1068			fsnotify_finish_user_wait(iter_info);
  1069	
  1070		return ret;
  1071	}
  1072	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
