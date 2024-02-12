Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660133FE35
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707744254; cv=none; b=Mo+gJ+pocEVvqBV88yrf2Q6yWJKRVHEUpiwRBQIS7VeKRAfU8rBs1+RINMNAh6le7XrLi+ULqUiqpxvLzjoAOPmU6DgUNfbn83/i4PY67OOc5L6oUD1Qtd4IeYCl/KcV8ge1OfTcGnqoIF2ffnAskHckHv3zM41Z0LXnM6w7Rf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707744254; c=relaxed/simple;
	bh=Q5uUBgxlPpL5D1/fFk+uf3vs4k8tqnf8rCkbOvIl+mI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JWT9MQKamg1eWScqI2sQFYNIQLskVotxVh4sfCZkG+03YJDco2zYiR40mKj4W2EGD0MRmYdug+74uYo72L0DO0M6p9VrFvxlbRdXlHlRrX1W1atDrjJfj9ruhTObAowAWMjZVa8IQWWuKoWDI+hvjVU2hIpLBI2Qu0Ysu8F3Xjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwY58yeE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwY58yeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707744253; x=1739280253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5uUBgxlPpL5D1/fFk+uf3vs4k8tqnf8rCkbOvIl+mI=;
  b=VwY58yeEQbfo7FoNPpgg2Qfc/ePQl0ThmS8vVVOkSyRSFCkek6DqTInR
   UV1TiTs7JlWoaw8Yit0B6d/ROpjYocWiCgDXewxenDxVnr3c/YoyHVVLW
   65dkwmUeW1BT0fUD5CvzLCjIRRxMbzDI/7fnosRN60m0YrJrKT01xOCT/
   z8j8UXsk5S4L+5kvSO0rLQMAJmD2pZt1NxQi2Pow6lCc5+FOH41vmXZtt
   TcToXMVdhOKWj3KSh6oHYTZz3rjXWGIhVNh1Hxwlcpjl7swkw1eMIE0v3
   1PeXPX41LJGd5uE+Wss4o7WwfRP8CNDOoTz93wFFzLtZcc8qlqGxXgzdG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1845184"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="1845184"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 05:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="2979810"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Feb 2024 05:24:10 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZWI3-00079C-2t;
	Mon, 12 Feb 2024 13:24:07 +0000
Date: Mon, 12 Feb 2024 21:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-perf 3/3] fs/notify/fanotify/../fsnotify.h:42:9:
 error: implicit declaration of function 'fsnotify_obj_sb'; did you mean
 'fsnotify_conn_sb'?
Message-ID: <202402122127.lH6JuFKZ-lkp@intel.com>
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
commit: 36091a66bd764d918cf5fcc5797bc82b878a2bfe [3/3] fsnotify: move s_fsnotify_connectors into sb connector
config: i386-buildonly-randconfig-003-20240212 (https://download.01.org/0day-ci/archive/20240212/202402122127.lH6JuFKZ-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402122127.lH6JuFKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402122127.lH6JuFKZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/notify/fanotify/../fsnotify.h:6,
                    from fs/notify/fanotify/fanotify_user.c:26:
   include/linux/fsnotify.h: In function 'fsnotify_access':
   include/linux/fsnotify.h:392:2: error: implicit declaration of function 'fsnotify_file'; did you mean 'fsnotify_link'? [-Werror=implicit-function-declaration]
     392 |  fsnotify_file(file, FS_ACCESS);
         |  ^~~~~~~~~~~~~
         |  fsnotify_link
   In file included from fs/notify/fanotify/fanotify_user.c:26:
   fs/notify/fanotify/../fsnotify.h: In function 'fsnotify_conn_sb':
>> fs/notify/fanotify/../fsnotify.h:42:9: error: implicit declaration of function 'fsnotify_obj_sb'; did you mean 'fsnotify_conn_sb'? [-Werror=implicit-function-declaration]
      42 |  return fsnotify_obj_sb(conn->obj);
         |         ^~~~~~~~~~~~~~~
         |         fsnotify_conn_sb
>> fs/notify/fanotify/../fsnotify.h:42:9: warning: returning 'int' from a function with return type 'struct super_block *' makes pointer from integer without a cast [-Wint-conversion]
      42 |  return fsnotify_obj_sb(conn->obj);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +42 fs/notify/fanotify/../fsnotify.h

     4	
     5	#include <linux/list.h>
   > 6	#include <linux/fsnotify.h>
     7	#include <linux/srcu.h>
     8	#include <linux/types.h>
     9	
    10	#include "../mount.h"
    11	
    12	static inline struct inode *fsnotify_connp_inode(fsnotify_connp_t *connp)
    13	{
    14		return container_of(connp, struct inode, i_fsnotify_marks);
    15	}
    16	
    17	static inline struct mount *fsnotify_connp_mount(fsnotify_connp_t *connp)
    18	{
    19		return container_of(connp, struct mount, mnt_fsnotify_marks);
    20	}
    21	
    22	static inline struct super_block *fsnotify_connp_sb(fsnotify_connp_t *connp)
    23	{
    24		return container_of(connp, struct super_block, s_fsnotify_marks);
    25	}
    26	
    27	static inline struct inode *fsnotify_conn_inode(
    28					struct fsnotify_mark_connector *conn)
    29	{
    30		return fsnotify_connp_inode(conn->obj);
    31	}
    32	
    33	static inline struct mount *fsnotify_conn_mount(
    34					struct fsnotify_mark_connector *conn)
    35	{
    36		return fsnotify_connp_mount(conn->obj);
    37	}
    38	
    39	static inline struct super_block *fsnotify_conn_sb(
    40					struct fsnotify_mark_connector *conn)
    41	{
  > 42		return fsnotify_obj_sb(conn->obj);
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
