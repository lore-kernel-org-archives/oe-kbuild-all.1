Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D064E1632DD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756563881; cv=none; b=L6AEhvFIENzSdQIyCl9LBRwLYkgIgCAnVL3K628hCui95urJbFXKFPHRECfect0vhjDTGlPED/AQnxY5q34faKSf6Rfug4I4wADaJT+NWE9XcrD18avgCdS6YH4AVPY/Pc+mawQDRXmAC1Ip7sE2dnZqZsLRzRkUoQT1tSVoZ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756563881; c=relaxed/simple;
	bh=K6dZbx4+ofZIx9iuL/rctfJk+4LDerKxr00uHK0N5kg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xkhz6P5PXitlkZ8VbtaV3MC/7awdebLzg5X46B5xUd7OloG8IMUWmT+vEoBdqt2RiTwlxnUNEguJAWj4meieXERxo4RkqBBoX9CTlQ0I7OIp8q/TSZ0sJtBlTJXQ9B1U6q7zx/62rt8PYea7GennhPIEvbmTJmWXeyjD8uBG898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzlWUI0q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzlWUI0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756563878; x=1788099878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K6dZbx4+ofZIx9iuL/rctfJk+4LDerKxr00uHK0N5kg=;
  b=mzlWUI0qRH3yfwL38ja/+5jFHQogdOvhTT1VAiZJNRuVcwYopJtrdRwD
   CNWAqedfkSVPzGUTk6QQcUTIbrzg0vSRN4tIHrdsHx/ze/Z4uUzEIzlAg
   DMXuf9FARwr+kwAw6Ay9JCHz/kxJ7+k9RI576u+3uopH3RN1jDq8QsWhQ
   ARTTTBJIuExKIHYArVuC0xCMJATvgM69s4dcSqalGfVTaE0yV76AXgGCo
   dcei7Ik/T/dR1xDhzFkV7gP7wtFHRiWn4QD1oAN9kDePV1IIlOaWLEtiY
   oyCCq6D2OjeZgko1WYioB9/999IvbwBWaRi97/5ZHatnU25DVQvL7UznO
   g==;
X-CSE-ConnectionGUID: nYMgxx6PQCO6qTmlbL1JNg==
X-CSE-MsgGUID: H0DIsd4/S5alCcfGTDJ4gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69423213"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69423213"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 07:24:38 -0700
X-CSE-ConnectionGUID: ZkSAhwS6R0GgMSWl8mGGvA==
X-CSE-MsgGUID: Dj+1V5mQRtWKPJ+97549Zw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Aug 2025 07:24:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usMVO-000VQp-2M;
	Sat, 30 Aug 2025 14:24:34 +0000
Date: Sat, 30 Aug 2025 22:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sun YangKai <sunk67188@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [btrfs:pr/1157 47/47] fs/btrfs/scrub.c:615:24: error: 'return' with
 a value, in function returning void
Message-ID: <202508302225.ainSyiW3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/btrfs/linux.git pr/1157
head:   2d6338c6972523b39e105aab0adf90ce3ce9ea15
commit: 2d6338c6972523b39e105aab0adf90ce3ce9ea15 [47/47] btrfs: more trivial BTRFS_PATH_AUTO_FREE conversions
config: powerpc-randconfig-001-20250830 (https://download.01.org/0day-ci/archive/20250830/202508302225.ainSyiW3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508302225.ainSyiW3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508302225.ainSyiW3-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/scrub.c: In function 'scrub_print_common_warning':
>> fs/btrfs/scrub.c:615:24: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     615 |                 return ret;
         |                        ^~~
   fs/btrfs/scrub.c:584:13: note: declared here
     584 | static void scrub_print_common_warning(const char *errstr, struct btrfs_device *dev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/return +615 fs/btrfs/scrub.c

   583	
   584	static void scrub_print_common_warning(const char *errstr, struct btrfs_device *dev,
   585					       bool is_super, u64 logical, u64 physical)
   586	{
   587		struct btrfs_fs_info *fs_info = dev->fs_info;
   588		BTRFS_PATH_AUTO_FREE(path);
   589		struct btrfs_key found_key;
   590		struct extent_buffer *eb;
   591		struct btrfs_extent_item *ei;
   592		struct scrub_warning swarn;
   593		u64 flags = 0;
   594		u32 item_size;
   595		int ret;
   596	
   597		/* Super block error, no need to search extent tree. */
   598		if (is_super) {
   599			btrfs_warn(fs_info, "scrub: %s on device %s, physical %llu",
   600					  errstr, btrfs_dev_name(dev), physical);
   601			return;
   602		}
   603		path = btrfs_alloc_path();
   604		if (!path)
   605			return;
   606	
   607		swarn.physical = physical;
   608		swarn.logical = logical;
   609		swarn.errstr = errstr;
   610		swarn.dev = NULL;
   611	
   612		ret = extent_from_logical(fs_info, swarn.logical, path, &found_key,
   613					  &flags);
   614		if (ret < 0)
 > 615			return ret;
   616	
   617		swarn.extent_item_size = found_key.offset;
   618	
   619		eb = path->nodes[0];
   620		ei = btrfs_item_ptr(eb, path->slots[0], struct btrfs_extent_item);
   621		item_size = btrfs_item_size(eb, path->slots[0]);
   622	
   623		if (flags & BTRFS_EXTENT_FLAG_TREE_BLOCK) {
   624			unsigned long ptr = 0;
   625			u8 ref_level;
   626			u64 ref_root;
   627	
   628			while (true) {
   629				ret = tree_backref_for_extent(&ptr, eb, &found_key, ei,
   630							      item_size, &ref_root,
   631							      &ref_level);
   632				if (ret < 0) {
   633					btrfs_warn(fs_info,
   634			   "scrub: failed to resolve tree backref for logical %llu: %d",
   635						   swarn.logical, ret);
   636					break;
   637				}
   638				if (ret > 0)
   639					break;
   640				btrfs_warn(fs_info,
   641	"scrub: %s at logical %llu on dev %s, physical %llu: metadata %s (level %d) in tree %llu",
   642					errstr, swarn.logical, btrfs_dev_name(dev),
   643					swarn.physical, (ref_level ? "node" : "leaf"),
   644					ref_level, ref_root);
   645			}
   646			btrfs_release_path(path);
   647		} else {
   648			struct btrfs_backref_walk_ctx ctx = { 0 };
   649	
   650			btrfs_release_path(path);
   651	
   652			ctx.bytenr = found_key.objectid;
   653			ctx.extent_item_pos = swarn.logical - found_key.objectid;
   654			ctx.fs_info = fs_info;
   655	
   656			swarn.path = path;
   657			swarn.dev = dev;
   658	
   659			iterate_extent_inodes(&ctx, true, scrub_print_warning_inode, &swarn);
   660		}
   661	}
   662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
