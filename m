Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E2A848E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707747869; cv=none; b=P/R3QBuKbjHSlnXblIL07Ta0ePiH5s/I/BfYZfMFRHu56o9VEZftv3xOncEZLAcdKa0WsJp3UlrUl4BGAINCGaWTN45CMC3tGIsKKp+PCXvTlEfiU/KsMG6Y4EMU+Z7Blvyw6twuoQpHoCPGqjkdOticMcvjMB9M5zC0m0gdDlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707747869; c=relaxed/simple;
	bh=R9XDUXINM68qM1/VtLNnHy1h47UATlY7+7V3xn93f80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RbWQ9eE994xCY6p1+gRVAwEbWO79pxyRxF1xKRy490BcpcFBXCP24FmN84D12ZjTMIqGszJxCoInRP1xnQH86yFxFE4JeHA0pvc+9Lpur2gt+TFTosrxyx15uTG3PUE1UEHQBZvxn7rmMQT/b7zMx1KD3bprd1CGqapuzwj55Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ktt5fy2q; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ktt5fy2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707747866; x=1739283866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R9XDUXINM68qM1/VtLNnHy1h47UATlY7+7V3xn93f80=;
  b=Ktt5fy2qvD4WOHW4+uFrShrS5CSqLN83JNTL9F9nmeTct+XuaoZIbiAu
   yNUTELR40vp1mgX4Bj9+a4eSVtuUaCcCoF2KSB5hB4blcIB5VxMapEMVN
   RGC/e1NWiPCHXo1YoauZTHLMurYFX+IJq2NnMAUkQ7JYB3gk/cuODESYB
   RUC9xVKp2OzTs0AAgGwudv29/JhI1mEdWxi9X9Mf50+0ytcKLACIkXvEP
   Uhu9gAbZXAnSyoU3M0ZUV6kTE9PxeCeEcHDqx13t/Al3Viw3wvdKPWygQ
   dShSs4xzx4wQWRBtd6FWte8ePBzjTxvOJSCcj4h4inpG8PyykmJ3+tVOu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="12283139"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="12283139"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 06:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="2601046"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Feb 2024 06:24:12 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZXE9-0007AU-2w;
	Mon, 12 Feb 2024 14:24:09 +0000
Date: Mon, 12 Feb 2024 22:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-perf 2/3] fs/notify/mark.c:164:44: error: use of
 undeclared identifier 'FSNOTIFY_CONTENT_EVENTS'; did you mean
 'FSNOTIFY_EVENT_DENTRY'?
Message-ID: <202402122214.6mxUsVWT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify-perf
head:   36091a66bd764d918cf5fcc5797bc82b878a2bfe
commit: 73565ecb39b003c9e458e58abeca8bab87ea8ecf [2/3] fsnotify: optimize the case of no content event watchers
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240212/202402122214.6mxUsVWT-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402122214.6mxUsVWT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402122214.6mxUsVWT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/notify/mark.c:77:
   In file included from fs/notify/fsnotify.h:6:
   include/linux/fsnotify.h:386:2: error: call to undeclared function 'fsnotify_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     386 |         fsnotify_file(file, FS_ACCESS);
         |         ^
   include/linux/fsnotify.h:394:2: error: call to undeclared function 'fsnotify_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     394 |         fsnotify_file(file, FS_MODIFY);
         |         ^
   include/linux/fsnotify.h:407:2: error: call to undeclared function 'fsnotify_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     407 |         fsnotify_file(file, mask);
         |         ^
   include/linux/fsnotify.h:418:2: error: call to undeclared function 'fsnotify_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     418 |         fsnotify_file(file, mask);
         |         ^
>> fs/notify/mark.c:164:44: error: use of undeclared identifier 'FSNOTIFY_CONTENT_EVENTS'; did you mean 'FSNOTIFY_EVENT_DENTRY'?
     164 |         u32 new_watchers = new_mask & ~old_mask & FSNOTIFY_CONTENT_EVENTS;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                   FSNOTIFY_EVENT_DENTRY
   include/linux/fsnotify_backend.h:298:2: note: 'FSNOTIFY_EVENT_DENTRY' declared here
     298 |         FSNOTIFY_EVENT_DENTRY,
         |         ^
   5 errors generated.


vim +164 fs/notify/mark.c

   155	
   156	/*
   157	 * To avoid the performance penalty of rare case of sb/mount content event
   158	 * watchers in the hot io path, taint sb if such watchers are added.
   159	 */
   160	static void fsnotify_update_sb_watchers(struct fsnotify_mark_connector *conn,
   161						u32 old_mask, u32 new_mask)
   162	{
   163		struct super_block *sb = fsnotify_connector_sb(conn);
 > 164		u32 new_watchers = new_mask & ~old_mask & FSNOTIFY_CONTENT_EVENTS;
   165	
   166		if (conn->type == FSNOTIFY_OBJ_TYPE_INODE || !sb || !new_watchers)
   167			return;
   168	
   169		/*
   170		 * TODO: We need to take sb conn->lock to set FS_MNT_CONTENT_WATCHED
   171		 * in sb->s_fsnotify_mask, but if this is a recalc of mount mark mask,
   172		 * it is not sure that we have an sb connector attached yet.
   173		 */
   174		sb->s_iflags |= SB_I_CONTENT_WATCHED;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
