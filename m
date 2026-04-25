Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACFA208D0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Apr 2026 00:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077970; cv=none; b=SzKnab93KVVI/eVdn8BHcfHau2bQHKFHZB/Jp1TH3Plj4sLrK8WMzSQ4uyJdfKmJWSFnUyne/cL0xQWq0JLpOuDFiQTldc09aPFjYiYS08xYYE9lg703BLrhgPVB8YH7mdY/To2PQD/huVa+1fJuCB/XDBfS2jSZV2c73UV0c00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077970; c=relaxed/simple;
	bh=SKPDhdmiuYZlh/DFd0q6rD1LAPWtAvCCQaqP4FpFRJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fODjrQ3DLBniqsNgtNDfgmXIU4QUKkparZ/4AbRrVxGMKxnUvslOCxCMcAp3UwsazdbUMXzS7348lfvOjiLZFI2CddeVGdliAEgT56Obh6q8RO3qKLNFuOH/R9+vwnCt6f94w7NYoF9daJqYu0g5v6rh63T42xNjTqmxq8MYQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2nENxyo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2nENxyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777077969; x=1808613969;
  h=date:from:to:cc:subject:message-id;
  bh=SKPDhdmiuYZlh/DFd0q6rD1LAPWtAvCCQaqP4FpFRJc=;
  b=R2nENxyoGGeag5RfGV5CM+pKGBk6vnT59k3E4GLuwfO0mX1TFInYpVrD
   XwrqBMbQjLEbqjoQaFljsR5jJngt4VIFVjmDWt2Cf2j39NKS9to2tQALA
   pgUTupOYq6K4LdHQsNRdD7NI9ck8WBFFhOfjJkbnPHWsDRfFdidYe4iz+
   A8SCSLDuHyfnSYDBYOM75Y0jHVS1t5l6w2w4i+H371hQWcy7wDOeUoq/+
   Z5i3VgHMeVa6DbM2Sdz8Sj+aJ81LxSR3AazWruYnCqv8stRnuk0SDS7JF
   U8MSWKayFZ87N+lJdhM22GhG2kYArxnCkt6xJG4GFSoncBwZCpp2my9Dt
   Q==;
X-CSE-ConnectionGUID: rPKW0vfATtGA38WJxbpaSg==
X-CSE-MsgGUID: jmhUYY0ET62jDhwDNIBqgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77976542"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="77976542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 17:46:08 -0700
X-CSE-ConnectionGUID: dyD3LkuFST2dZEfKDuRkNg==
X-CSE-MsgGUID: zCQyT4+4TyO9bthY/ivLjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="263492705"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 24 Apr 2026 17:46:07 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGR9p-000000003KT-22Pc;
	Sat, 25 Apr 2026 00:46:05 +0000
Date: Sat, 25 Apr 2026 02:45:58 +0200
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/gpu/drm/vkms/vkms_configfs.c:385:1: warning: the
 frame size of 4104 bytes is larger than 2048 bytes
Message-ID: <202604250228.3SLm6WUg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-drm_mode_config-Add-helper-to-get-plane-type-name/20260424-152519
head:   177e00894c9e43673e9a7be1793cc3eadad851be
commit: b7378f6b326dab3c921114bc54438807ea584614 drm/vkms: Introduce configfs for plane name
date:   17 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260425/202604250228.3SLm6WUg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604250228.3SLm6WUg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604250228.3SLm6WUg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vkms/vkms_configfs.c: In function 'plane_name_store':
>> drivers/gpu/drm/vkms/vkms_configfs.c:385:1: warning: the frame size of 4104 bytes is larger than 2048 bytes [-Wframe-larger-than=]
     385 | }
         | ^


vim +385 drivers/gpu/drm/vkms/vkms_configfs.c

   342	
   343	static ssize_t plane_name_store(struct config_item *item, const char *page,
   344					size_t count)
   345	{
   346		struct vkms_configfs_plane *plane;
   347		char name_tmp[PAGE_SIZE];
   348		size_t str_len;
   349		int ret;
   350	
   351		memcpy(name_tmp, page, PAGE_SIZE);
   352	
   353		plane = plane_item_to_vkms_configfs_plane(item);
   354	
   355		// strspn is not lenght-protected, ensure that page is a null-terminated string.
   356		str_len = strnlen(name_tmp, count);
   357		if (str_len > count)
   358			return -EINVAL;
   359	
   360		if (count > 0) {
   361			size_t expected_count = count;
   362	
   363			if (name_tmp[count-1] == '\n') {
   364				expected_count = count - 1;
   365				name_tmp[count-1] = '\0';
   366			}
   367	
   368			if (strspn(name_tmp,
   369				   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-")
   370			    != expected_count)
   371				return -EINVAL;
   372		}
   373	
   374	
   375		scoped_guard(mutex, &plane->dev->lock) {
   376			if (plane->dev->enabled)
   377				return -EBUSY;
   378	
   379			ret = vkms_config_plane_set_name(plane->config, name_tmp);
   380			if (ret)
   381				return ret;
   382		}
   383	
   384		return (ssize_t)count;
 > 385	}
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
