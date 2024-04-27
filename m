Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A472E852
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 02:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714186526; cv=none; b=XCAUkHT+KXhIIovFhsdubNWNYDuENuN+tcY0BDRaJqXLceHGVjkXtfLCdc2NbpOu8sa15NdFYnFs2K94ehMx+mcyllCd6/dBuzai7cJJGJKkR+NZDqEuhuzK+i3NMuWB+NAmZO6PYs8gH1SzVd3hL4t7QeioJNQx+3inVVD5VfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714186526; c=relaxed/simple;
	bh=XsM6XYeT/mY8RQBR8S4RkZtSULcwgfVuKiwm4Xz0MR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2Zj/tEkPr2xQs+ULE8Siuexlr3YWbDjHnbRDbbJpgM3xUXb+v7w86ElC9K1uzW6yl3K8PqrNqSKeIfCRrKD96S4//ysVGPbTaTbTy7CYtRv+/nphv3mKsAJyHg+PToZA08kIEYfQeajQOFr3QGnIqelldLlh46ivwOjhzWYKdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCTbnO4E; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCTbnO4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714186524; x=1745722524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XsM6XYeT/mY8RQBR8S4RkZtSULcwgfVuKiwm4Xz0MR4=;
  b=iCTbnO4Ew4rbLe2aGosqL6ky73WZZRPr5K0SrAXUoF9lRtHTzSe/btDP
   MvhfaeEUN86oY/jiGfYSzY62TDlAopejjoSxT3egwZia0V0C/wJZklUjH
   Xrznn4JhXBUXBEuQ9/8qEONo+1QwgB4ThrvuKFRgnispiZN0EWnWKho0b
   n4x1YkQ1TyxeviMSQT4mjN41s1pSnWAFEh2PBFXhgqXuF23EEehswY889
   7lNLdDBMVwzjiL5g9K9eLkVidbeF8fqECYyFQTxk68ZohV+93AQPOK+AB
   gWZnoGe7WM5TvAKd/N1hGJPAy8UxeCXXlOrU5fu+rfnN6uTlHRwkpwj5A
   Q==;
X-CSE-ConnectionGUID: MYtYPBk2RumllwCsw++vqQ==
X-CSE-MsgGUID: IdEMLGYVQ2WPpzf9/yabLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10054332"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="10054332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 19:55:24 -0700
X-CSE-ConnectionGUID: gB0wTtKhRhywyQjubJlreg==
X-CSE-MsgGUID: 9otBMarUSSC8USWSmL4g/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="30246288"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Apr 2024 19:55:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0YDf-0004bG-1I;
	Sat, 27 Apr 2024 02:55:19 +0000
Date: Sat, 27 Apr 2024 10:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:for-linux-next 1/1]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1117: warning: cannot
 understand function prototype: 'struct registry_list_entry '
Message-ID: <202404271044.gYbO4F1B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   61ba791c4a7a09a370c45b70a81b8c7d4cf6b2ae
commit: b58a0bc904ffa091fc020f7fd00e91808fec820e [1/1] nouveau: add command-line GSP-RM registry support
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240427/202404271044.gYbO4F1B-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271044.gYbO4F1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271044.gYbO4F1B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1117: warning: cannot understand function prototype: 'struct registry_list_entry '
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1320: warning: cannot understand function prototype: 'const struct nv_gsp_registry_entries r535_registry_entries[] = '


vim +1117 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

  1093	
  1094	/**
  1095	 * registry_list_entry - linked list member for a registry key/value
  1096	 * @head: list_head struct
  1097	 * @type: dword, binary, or string
  1098	 * @klen: the length of name of the key
  1099	 * @vlen: the length of the value
  1100	 * @key: the key name
  1101	 * @dword: the data, if REGISTRY_TABLE_ENTRY_TYPE_DWORD
  1102	 * @binary: the data, if TYPE_BINARY or TYPE_STRING
  1103	 *
  1104	 * Every registry key/value is represented internally by this struct.
  1105	 *
  1106	 * Type DWORD is a simple 32-bit unsigned integer, and its value is stored in
  1107	 * @dword.
  1108	 *
  1109	 * Types BINARY and STRING are variable-length binary blobs.  The only real
  1110	 * difference between BINARY and STRING is that STRING is null-terminated and
  1111	 * is expected to contain only printable characters.
  1112	 *
  1113	 * Note: it is technically possible to have multiple keys with the same name
  1114	 * but different types, but this is not useful since GSP-RM expects keys to
  1115	 * have only one specific type.
  1116	 */
> 1117	struct registry_list_entry {
  1118		struct list_head head;
  1119		enum registry_type type;
  1120		size_t klen;
  1121		char key[REGISTRY_MAX_KEY_LENGTH];
  1122		size_t vlen;
  1123		u32 dword;			/* TYPE_DWORD */
  1124		u8 binary[] __counted_by(vlen);	/* TYPE_BINARY or TYPE_STRING */
  1125	};
  1126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
