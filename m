Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B77224AE8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 05:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766381899; cv=none; b=mSnnfK/qoBDrgjF9axnFM7hN0PQzvUdVHkTOE6zf0YFdu43j+Sro5599ufINkQUyuhkjSQW+tVRR2rM2rxm+NJyPp9KVZSGPXztXx+cOnYien0NdMPQvf9erhzfRlcayVwTKpYG9COkn9zBaaso/+e8BIVpvHxkQJE4TE/KDyK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766381899; c=relaxed/simple;
	bh=eSRZZaZcXJRlDQhxtvk2EQ8i9i8zgWz+Y+D56ODgW3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezXNoacPzNj6/SRNi8TVW3wNbroo305h+H81Nxyipj6b6R8kBQ99vjOBQMyfYG3cnPdZlVT8eG7VxvlRH8nzviIbQv1B+X0rsq7aU3eDAt0pSQjKyzeF1xjE3jjOiDu2xp5YDv9yMBJGJYxEuJeIWjt6orMpwVcnqj7YlcLQ+Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGr6Ean7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGr6Ean7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766381897; x=1797917897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eSRZZaZcXJRlDQhxtvk2EQ8i9i8zgWz+Y+D56ODgW3Y=;
  b=KGr6Ean7aolVtX5x5I9n01/NLF+GsIQkdZyMKFCYj2mLSCwQ9xLizI6t
   RMOjCeTJWmIMz/KT5wmbX/DTktlbzvBXVqQCMW9X8UYYhxXINRZm4aFd+
   CAjqaMsF3r4kw4TPpqTQTkpjMnEWKIyMNUv6z/AHLltetzqujiIoh9QKp
   IdTm689ivzKNhjxB7AQGEgasSv2IkYwzRHUI6XMdKPgdt7dm0N5moVYmf
   aP65S8vKOCymxdsbU362W85Lt8nbrbCai3J/Y2RTIbqxuNW9zlBxtgl6T
   pwGrwFjjBZpBlmgnmqfAlD2MJs3njSbZ8WowO77VK8wTora5e5VeeSF0j
   w==;
X-CSE-ConnectionGUID: QkvAXJeuSVabENnxnhpYlw==
X-CSE-MsgGUID: Ek5EmAe4QVm9/ZNltZ2AhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85819945"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85819945"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 21:38:16 -0800
X-CSE-ConnectionGUID: ECKxL/r8R5uSmuSbmFU3Ew==
X-CSE-MsgGUID: zsz1g7CWQtu7Hqc60/yR4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="236856084"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2025 21:38:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXYcW-000000005NA-04iv;
	Mon, 22 Dec 2025 05:38:12 +0000
Date: Mon, 22 Dec 2025 06:37:34 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 27/131] htmldocs:
 Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2220: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202512220607.HoC4BSEa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: b886d10007f0ffbc60bd09f6ec5e1184d397f3b9 [27/131] kernel/api: add API specification for sys_epoll_create1
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220607.HoC4BSEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220607.HoC4BSEa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/dcache.h
   WARNING: ./fs/inode.c:1607 function parameter 'isnew' not described in 'ilookup5_nowait'
   WARNING: ./fs/namei.c:2853 function parameter 'state' not described in '__start_dirop'
   WARNING: ./fs/namei.c:2853 expecting prototype for start_dirop(). Prototype was for __start_dirop() instead
   Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2219: ERROR: Unexpected indentation. [docutils]
>> Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2220: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2254: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2294: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2301: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2307: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2311: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2317: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2322: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2326: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2327: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/filesystems/api-summary:125: ./fs/eventpoll.c:2351: WARNING: Inline emphasis start-string without end-string. [docutils]
   ERROR: Cannot find file ./include/linux/buffer_head.h
   WARNING: No kernel-doc for file ./include/linux/buffer_head.h
   ERROR: Cannot find file ./include/linux/fscache-cache.h
   WARNING: No kernel-doc for file ./include/linux/fscache-cache.h
   ERROR: Cannot find file ./include/linux/fscache.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
