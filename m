Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154341822FB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720096409; cv=none; b=eDxYw6hGOSJgI55bzAu/3nbWet9T+nwCN2KPxt3rtZ4T0VH2NAs68EnevsKboHk9nWnuF9y5sh5oD69/FxS4HBFfCjgXPzkQs/f8sJUiiivngp/dL0JrNBdYTITG+08tE1B0Ubp+RV5R92x5S0HZXUaucUqiHCx6WKzcJ83OKh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720096409; c=relaxed/simple;
	bh=5NTTKxVE7KLTK6rqJyNoxjXz3bSdVVoMM88Nsb88vmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qlYR+Mnn4L7A2fxih5+lvfrf7dkHNllt5HH+8zENmd/LmU0jtjggy3ezrvGy8MdN0zTv0OPFYV+5HIlJ/ulhS6ZFSUDLhAnz7MBuKaRPuG9z+8975YkuDpf0DXSdOsj/HeTHH7dEmvI73Fqnu5HwiQxypC+6l6ln+zVIyuy4vLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUq9sWYN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUq9sWYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720096409; x=1751632409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5NTTKxVE7KLTK6rqJyNoxjXz3bSdVVoMM88Nsb88vmU=;
  b=YUq9sWYNigSQoHXSAlN6w1PbU1uhchPVLjRHkTefwp6tfTDTP5nosk8m
   wxHvrSvBrGixPNIj4KFFA2hElvsxFHxN4up+ypCdSHqAjPBMkN4zh+zTN
   ETpIeK6yW2EN6obIouiOmTCx/n/ZF1iD94Rgw2uEM+nYyqy/eDh78HL//
   WhBPhOBFz/FhqdkWhn8pui4TCSaaYNKmdQN/6uojGp3NK2LoFgkZ+k7Qo
   /lxXo/pYQrLzrsE5z9qxZZlDn0PVIGpJxKDKVk8ve6c8NYnSkSRHfJi/V
   52uitbRx81tvtgB+b031Tk69HxS/gVqmeAWfWoPihNh4mw5RuYf6bhqZv
   Q==;
X-CSE-ConnectionGUID: iKO5FOZnS9SMUlKWDk7taw==
X-CSE-MsgGUID: K1EuBdqhRt67jBgF2ik+Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39888808"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39888808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 05:33:28 -0700
X-CSE-ConnectionGUID: yMCeLQ8AREuxWsRF8034eQ==
X-CSE-MsgGUID: pYRaooyqQO26+oiA0CNb5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51759785"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2024 05:33:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPLeO-000QzO-2v;
	Thu, 04 Jul 2024 12:33:24 +0000
Date: Thu, 4 Jul 2024 20:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify_for_lkp 9/9] fs/notify/fsnotify.c:193:5: warning:
 no previous prototype for 'fsnotify_path'
Message-ID: <202407042006.4rHfBSZv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify_for_lkp
head:   388baed2ddef701fe2f07ea0360228c60532ed22
commit: 388baed2ddef701fe2f07ea0360228c60532ed22 [9/9] fsnotify: un-inline fsnotify helpers
config: arm-hisi_defconfig (https://download.01.org/0day-ci/archive/20240704/202407042006.4rHfBSZv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407042006.4rHfBSZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407042006.4rHfBSZv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/notify/fsnotify.c:193:5: warning: no previous prototype for 'fsnotify_path' [-Wmissing-prototypes]
     193 | int fsnotify_path(const struct path *path, __u32 mask)
         |     ^~~~~~~~~~~~~
>> fs/notify/fsnotify.c:199:5: warning: no previous prototype for 'fsnotify_file_range' [-Wmissing-prototypes]
     199 | int fsnotify_file_range(struct file *file, __u32 mask, const loff_t *ppos,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/fsnotify_path +193 fs/notify/fsnotify.c

   192	
 > 193	int fsnotify_path(const struct path *path, __u32 mask)
   194	{
   195		return fsnotify_parent(path->dentry, mask, path, FSNOTIFY_EVENT_PATH);
   196	}
   197	EXPORT_SYMBOL_GPL(fsnotify_path);
   198	
 > 199	int fsnotify_file_range(struct file *file, __u32 mask, const loff_t *ppos,
   200				size_t count)
   201	{
   202		struct file_range range;
   203	
   204		range.path = &file->f_path;
   205		range.ppos = ppos;
   206		range.count = count;
   207	
   208		return fsnotify_parent(range.path->dentry, mask, &range,
   209				       FSNOTIFY_EVENT_FILE_RANGE);
   210	}
   211	EXPORT_SYMBOL_GPL(fsnotify_file_range);
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
