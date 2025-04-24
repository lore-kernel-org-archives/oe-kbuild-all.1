Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6BBF510
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 04:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745469394; cv=none; b=MGmfP8r4HslpxgO6RypRdWvtA2nNXpH/ZjmIi9gDXaHj9w15w8nAgsJP54O0cwEGZSomsA4mWn7wcc6iZV2cQI4PvS5sOstqQCWNox/DCqPJ7a2+v9PZWG8LzOYDLDBSs57zi6cAD+AE2Q7qtAErak5Sws+y5iwCIiWtPzQsZJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745469394; c=relaxed/simple;
	bh=bXfhjBzNxIGMQHA/r6tpUHzXyPCeMAZ8QREUw5Akivg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rmbItKiJq09Mtg0upuzUSETolkejtOZQQ6/nKgJ5xJ1SofXklpkSKVy9Z3zk/63Civ4vRoYnCQ0WCY+2h+H5kPHO/2rP4JOSR4T94Ei9pfTAY8I2ADS8S5EjhLn9NIpYMIlWa+Kho3azxL6WbWWkfL5qsajFImApL5n/9XFB4oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkTU2O+L; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkTU2O+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745469391; x=1777005391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bXfhjBzNxIGMQHA/r6tpUHzXyPCeMAZ8QREUw5Akivg=;
  b=EkTU2O+LggUV4LwAB+09tYelzPQ/kAMyo4JbkSv7Acocg1cDlGd0gfvQ
   h7nKgnPjJAcQFRAoE7uf+ygzU17X9syAEvC99XIRHtezfay8X2pKn+Kin
   ZwWl8rgPwjJaGoL+YAjzQO/p2Sb0QpiBuAn1rcUwxaX0ozukgXfWipomb
   Mv/ccJgY9P74vFalK7gGSQ1gqIueNV1qL5tM9av7c+gFJnBpMi9EhrnQp
   rRK9KvKhfFJyHqGMmnX0Qlo1f1tuXrTLezl68rhb8UVhwiJ5Ye2DmESnt
   XAicDdZXkSyv/wRX7C7QRDCpaclPXOZcSfvsvuMoM//4PGDrNrZkihkBl
   g==;
X-CSE-ConnectionGUID: C6+qctxOTs+H98qZ9NVNHA==
X-CSE-MsgGUID: Pxreg+8/RIWoXa7K8AkLyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50884404"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50884404"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 21:36:30 -0700
X-CSE-ConnectionGUID: eA0cWxI9TP6e9TbanzzkpQ==
X-CSE-MsgGUID: xWmjn1MJTbe04/MJMP81lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132414603"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Apr 2025 21:36:30 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7oK3-0003rV-1B;
	Thu, 24 Apr 2025 04:36:27 +0000
Date: Thu, 24 Apr 2025 12:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20250423-v6.15-rc3-ext4-fix 2/2] mm/migrate.c:963:50: error:
 'bh_migrate_folio_norefs_nohead_invalid' undeclared; did you mean
 'bh_migrate_folio_norefs_nohead_fails'?
Message-ID: <202504241233.UP3c1pmN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20250423-v6.15-rc3-ext4-fix
head:   58ad1a2b2d0abfd272e05e695cd4c635f49e934e
commit: 58ad1a2b2d0abfd272e05e695cd4c635f49e934e [2/2] mm: add migration buffer-head debugfs interface
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250424/202504241233.UP3c1pmN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241233.UP3c1pmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504241233.UP3c1pmN-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/migrate.c: In function '__buffer_migrate_folio':
>> mm/migrate.c:963:50: error: 'bh_migrate_folio_norefs_nohead_invalid' undeclared (first use in this function); did you mean 'bh_migrate_folio_norefs_nohead_fails'?
     963 |                                 atomic_long_inc(&bh_migrate_folio_norefs_nohead_invalid);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  bh_migrate_folio_norefs_nohead_fails
   mm/migrate.c:963:50: note: each undeclared identifier is reported only once for each function it appears in
   mm/migrate.c: At top level:
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


vim +963 mm/migrate.c

   947	
   948	static int __buffer_migrate_folio(struct address_space *mapping,
   949			struct folio *dst, struct folio *src, enum migrate_mode mode,
   950			bool check_refs)
   951	{
   952		struct buffer_head *bh, *head;
   953		int rc;
   954		int expected_count;
   955	
   956		head = folio_buffers(src);
   957		if (!head) {
   958			rc = migrate_folio(mapping, dst, src, mode);
   959			if (check_refs) {
   960				if (rc == 0)
   961					atomic_long_inc(&bh_migrate_folio_norefs_nohead_success);
   962				else
 > 963					atomic_long_inc(&bh_migrate_folio_norefs_nohead_invalid);
   964			}
   965			return rc;
   966		}
   967	
   968		/* Check whether page does not have extra refs before we do more work */
   969		expected_count = folio_expected_refs(mapping, src);
   970		if (folio_ref_count(src) != expected_count)
   971			return -EAGAIN;
   972	
   973		if (!buffer_migrate_lock_buffers(head, mode))
   974			return -EAGAIN;
   975	
   976		if (check_refs) {
   977			bool busy, migrating;
   978			bool invalidated = false;
   979	
   980			migrating = test_and_set_bit_lock(BH_Migrate, &head->b_state);
   981			VM_WARN_ON_ONCE(migrating);
   982	recheck_buffers:
   983			busy = false;
   984			spin_lock(&mapping->i_private_lock);
   985			bh = head;
   986			do {
   987				if (atomic_read(&bh->b_count)) {
   988					busy = true;
   989					break;
   990				}
   991				bh = bh->b_this_page;
   992			} while (bh != head);
   993			spin_unlock(&mapping->i_private_lock);
   994			if (busy) {
   995				if (invalidated) {
   996					rc = -EAGAIN;
   997					atomic_long_inc(&bh_migrate_folio_norefs_busy);
   998					goto unlock_buffers;
   999				}
  1000				invalidate_bh_lrus();
  1001				invalidated = true;
  1002				goto recheck_buffers;
  1003			}
  1004			atomic_long_inc(&bh_migrate_folio_norefs_valid);
  1005		}
  1006	
  1007		rc = filemap_migrate_folio(mapping, dst, src, mode);
  1008		if (rc != MIGRATEPAGE_SUCCESS) {
  1009			if (check_refs)
  1010				atomic_long_inc(&bh_migrate_folio_norefs_valid_fails);
  1011			goto unlock_buffers;
  1012		} else if (check_refs)
  1013			atomic_long_inc(&bh_migrate_folio_norefs_valid_success);
  1014	
  1015		bh = head;
  1016		do {
  1017			folio_set_bh(bh, dst, bh_offset(bh));
  1018			bh = bh->b_this_page;
  1019		} while (bh != head);
  1020	
  1021	unlock_buffers:
  1022		if (check_refs)
  1023			clear_bit_unlock(BH_Migrate, &head->b_state);
  1024		bh = head;
  1025		do {
  1026			unlock_buffer(bh);
  1027			bh = bh->b_this_page;
  1028		} while (bh != head);
  1029	
  1030		return rc;
  1031	}
  1032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
