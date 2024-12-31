Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9758F5E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 00:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735605369; cv=none; b=geF8rZQ88nOgn3zk9/VcBLT5kaxxipTlNzIgwN6RyZ9/58uOBb173I3KpMf7ohccEkW5GecP8PxunKdjgOaWsL7o7PLhb2v6ar8LsikclppcuLhJo7PdaXU8uePPekdOnzsAoHib3kSxus49+GwDSQD/fy1t5vGuzgJK2Tayes0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735605369; c=relaxed/simple;
	bh=fhEb/EBnJXNUd/wOQRnU6MnQ2hFqO1xhHnaWLyuFEaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QqRxRrBAcwN5gHFpI7e7s35bDjhcQ9NMCq6jHN2V0mlfi9CXxtarUdhM6KAM19DsSnmD3GI3OH/Zob6DcGYPK0v5IKwVLDMZ3Vdbdh2/oG4H45tK+uJWudL6fvioY1DVA1VZV7FbTiBzaDh3JFt+uygR7FLwMD/vRJGX+IB9+/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JytcWg/X; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JytcWg/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735605367; x=1767141367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fhEb/EBnJXNUd/wOQRnU6MnQ2hFqO1xhHnaWLyuFEaw=;
  b=JytcWg/XWnjeTxCnmOsM1hLWJ5U76f6QavcC+YqxpFbETMK8JNiy12LY
   22fDxSqnJQPXO2hm3KFo+omb7Wz+HMj/JQM9ilDJAQ5mD+q+PbRCmBs5B
   otK6PMRJhVV9pruNM99suQiTQhZnwjoJpjqpooOPyjg+qD5Ec7ST73TXh
   EJHJC2gcU34SWtM1RjjJEVFKV3f+g3oeHDyUMsgVLXn02vJiFbK+ognJ2
   EKHj5BUa9nzRASakTce/fICuRGXI8/zqNhMOok1v6Ha3DNrpxSyWjwcs5
   95HKtG7Ar69hrGT8FLs5ziPes5EDpKJK1SFigv3I6ltpMtxtQajjDymKL
   A==;
X-CSE-ConnectionGUID: su2WxZ+ISUGJFGtto7FqMA==
X-CSE-MsgGUID: GEN/SvU/QHCC993EGYjqbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39818749"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="39818749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:36:07 -0800
X-CSE-ConnectionGUID: wcU12ezKT+2i2Pl2/FfzpA==
X-CSE-MsgGUID: J4GA6EHDSRGqBRDbgjkw+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138257044"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Dec 2024 16:36:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSQEt-0006V0-0n;
	Tue, 31 Dec 2024 00:36:03 +0000
Date: Tue, 31 Dec 2024 08:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1117: warning: cannot
 understand function prototype: 'struct registry_list_entry '
Message-ID: <202412310834.jtCJj4oz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: b58a0bc904ffa091fc020f7fd00e91808fec820e nouveau: add command-line GSP-RM registry support
date:   8 months ago
config: mips-randconfig-c004-20220208 (https://download.01.org/0day-ci/archive/20241231/202412310834.jtCJj4oz-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310834.jtCJj4oz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310834.jtCJj4oz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1117: warning: cannot understand function prototype: 'struct registry_list_entry '
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1320: warning: cannot understand function prototype: 'const struct nv_gsp_registry_entries r535_registry_entries[] = '


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
