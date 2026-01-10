Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E98722759C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768060269; cv=none; b=QOPIlefzVhEVKIIr4lc8ptps/cBdpFu5jnrZJZh8sfSHtXurHSBr73Ehz5OBL6SsGaqjHdIrIim+qoJuWgQJRVGidLCw2A6dKkwt+LV7ewoiv27KNOQP1q7+Atjmes0Wtr5reV78+PC3fQyLYI6YzBr6mGK/sdnbEX1fsFhk+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768060269; c=relaxed/simple;
	bh=x5jA9LJ21uaiXkFpjtmqrTW7r9dohOhW9jk2E34pROU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ut64McNOCVRJmjK+MePnlcJqEMPjDO99p4Ye6PnbU8dCX4KFNej7zjiqxqaWE8cPkOboH+72LH+Lsz9BAfk9J5AmmtCu3F4lwaka7uf6ZTiSUY/Utp9kgZx/DryDetLGrNYjrGIE324Rn9BX+SBhpejP1qdVVOnhWqJS30yeuLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFG2oHJR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFG2oHJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768060268; x=1799596268;
  h=date:from:to:cc:subject:message-id;
  bh=x5jA9LJ21uaiXkFpjtmqrTW7r9dohOhW9jk2E34pROU=;
  b=bFG2oHJRiLrZox9cUGP9CNkXmSrgtxalYWgrekMPoenbeGhqpfPGoEP9
   NCc5VCYyQF14DiD+ftveeuYJiL5L+TCsSkzokqruvrv29/WSMTFYVefDc
   IxIRCD9LXyu+b1oJOWHKwh1Y0IfjxAumySdvX8dwpgpEGqlWwH1Xgr83K
   hmvZvFIXCGl06FR9B8PBYgZXIxppLuET6AKG7o85ZTZroQ6PVUF9hBJiX
   tHtZWvqA4QpUk/pAUuXSl/s08wvHU/8wvLV9HxTVhWPrShqgH+hL2xcUF
   M/l9aC6akDeZ/fvOxPa2K+S+nwW9sJXSoUbIudEmYLPwMMF1LLlfY2Sr6
   A==;
X-CSE-ConnectionGUID: ArfYgHc2QkejaleTn0PYaQ==
X-CSE-MsgGUID: YXYjYoc1QPa5/b3Z/H/raQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69482440"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69482440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 07:51:07 -0800
X-CSE-ConnectionGUID: 1ad327AGQByuOIMdCUpygA==
X-CSE-MsgGUID: nmvu7VJGQImrmxh0DVON2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="241221521"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jan 2026 07:51:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vebF1-000000008py-2HnF;
	Sat, 10 Jan 2026 15:51:03 +0000
Date: Sat, 10 Jan 2026 23:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 811/1155] fs/bcachefs/init/dev.c:877:1:
 warning: the frame size of 1312 bytes is larger than 1280 bytes
Message-ID: <202601102307.52Oy8pgm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   af2e18a32ff0ee83f028b504e0ff92450377ff24
commit: 2d5b91710aa7ad9be30987c0785464fb9fd2abe8 [811/1155] bcachefs: bch_member.device_name
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260110/202601102307.52Oy8pgm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601102307.52Oy8pgm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601102307.52Oy8pgm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/init/dev.c: In function 'bch2_dev_add':
>> fs/bcachefs/init/dev.c:877:1: warning: the frame size of 1312 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     877 | }
         | ^


vim +877 fs/bcachefs/init/dev.c

bf25974be5b42c Kent Overstreet 2025-10-04  729  
bf25974be5b42c Kent Overstreet 2025-10-04  730  /* Add new device to running filesystem: */
bf25974be5b42c Kent Overstreet 2025-10-04  731  int bch2_dev_add(struct bch_fs *c, const char *path, struct printbuf *err)
bf25974be5b42c Kent Overstreet 2025-10-04  732  {
bf25974be5b42c Kent Overstreet 2025-10-04  733  	struct bch_opts opts = bch2_opts_empty();
f6c311b744e85d Kent Overstreet 2025-11-10  734  	struct bch_sb_handle sb __cleanup(bch2_free_super) = {};
bf25974be5b42c Kent Overstreet 2025-10-04  735  	struct bch_dev *ca = NULL;
bf25974be5b42c Kent Overstreet 2025-10-04  736  	CLASS(printbuf, label)();
bf25974be5b42c Kent Overstreet 2025-10-04  737  	int ret = 0;
bf25974be5b42c Kent Overstreet 2025-10-04  738  
bf25974be5b42c Kent Overstreet 2025-10-04  739  	ret = bch2_read_super(path, &opts, &sb);
bf25974be5b42c Kent Overstreet 2025-10-04  740  	if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  741  		prt_printf(err, "error reading superblock: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  742  		goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  743  	}
bf25974be5b42c Kent Overstreet 2025-10-04  744  
bf25974be5b42c Kent Overstreet 2025-10-04  745  	struct bch_member dev_mi = bch2_sb_member_get(sb.sb, sb.sb->dev_idx);
bf25974be5b42c Kent Overstreet 2025-10-04  746  
bf25974be5b42c Kent Overstreet 2025-10-04  747  	if (BCH_MEMBER_GROUP(&dev_mi)) {
bf25974be5b42c Kent Overstreet 2025-10-04  748  		bch2_disk_path_to_text_sb(&label, sb.sb, BCH_MEMBER_GROUP(&dev_mi) - 1);
bf25974be5b42c Kent Overstreet 2025-10-04  749  		if (label.allocation_failure) {
bf25974be5b42c Kent Overstreet 2025-10-04  750  			ret = -ENOMEM;
bf25974be5b42c Kent Overstreet 2025-10-04  751  			goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  752  		}
bf25974be5b42c Kent Overstreet 2025-10-04  753  	}
bf25974be5b42c Kent Overstreet 2025-10-04  754  
bf25974be5b42c Kent Overstreet 2025-10-04  755  	if (list_empty(&c->list)) {
bf25974be5b42c Kent Overstreet 2025-10-04  756  		scoped_guard(mutex, &bch2_fs_list_lock) {
bf25974be5b42c Kent Overstreet 2025-10-04  757  			if (__bch2_uuid_to_fs(c->sb.uuid))
bf25974be5b42c Kent Overstreet 2025-10-04  758  				ret = bch_err_throw(c, filesystem_uuid_already_open);
bf25974be5b42c Kent Overstreet 2025-10-04  759  			else
bf25974be5b42c Kent Overstreet 2025-10-04  760  				list_add(&c->list, &bch2_fs_list);
bf25974be5b42c Kent Overstreet 2025-10-04  761  		}
bf25974be5b42c Kent Overstreet 2025-10-04  762  
bf25974be5b42c Kent Overstreet 2025-10-04  763  		if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  764  			prt_printf(err, "cannot go multidevice: filesystem UUID already open\n");
bf25974be5b42c Kent Overstreet 2025-10-04  765  			goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  766  		}
bf25974be5b42c Kent Overstreet 2025-10-04  767  	}
bf25974be5b42c Kent Overstreet 2025-10-04  768  
bf25974be5b42c Kent Overstreet 2025-10-04  769  	ret = bch2_dev_may_add(sb.sb, c);
bf25974be5b42c Kent Overstreet 2025-10-04  770  	if (ret)
bf25974be5b42c Kent Overstreet 2025-10-04  771  		goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  772  
bf25974be5b42c Kent Overstreet 2025-10-04  773  	ca = __bch2_dev_alloc(c, &dev_mi);
bf25974be5b42c Kent Overstreet 2025-10-04  774  	if (!ca) {
bf25974be5b42c Kent Overstreet 2025-10-04  775  		ret = -ENOMEM;
bf25974be5b42c Kent Overstreet 2025-10-04  776  		goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  777  	}
bf25974be5b42c Kent Overstreet 2025-10-04  778  
2d5b91710aa7ad Kent Overstreet 2025-11-10  779  	ret = __bch2_dev_attach_bdev(c, ca, &sb, err);
bf25974be5b42c Kent Overstreet 2025-10-04  780  	if (ret)
bf25974be5b42c Kent Overstreet 2025-10-04  781  		goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  782  
bf25974be5b42c Kent Overstreet 2025-10-04  783  	scoped_guard(rwsem_write, &c->state_lock) {
bf25974be5b42c Kent Overstreet 2025-10-04  784  		scoped_guard(mutex, &c->sb_lock) {
bf25974be5b42c Kent Overstreet 2025-10-04  785  			SET_BCH_SB_MULTI_DEVICE(c->disk_sb.sb, true);
bf25974be5b42c Kent Overstreet 2025-10-04  786  
bf25974be5b42c Kent Overstreet 2025-10-04  787  			ret = bch2_sb_from_fs(c, ca);
bf25974be5b42c Kent Overstreet 2025-10-04  788  			if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  789  				prt_printf(err, "error setting up new superblock: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  790  				goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  791  			}
bf25974be5b42c Kent Overstreet 2025-10-04  792  
bf25974be5b42c Kent Overstreet 2025-10-04  793  			if (dynamic_fault("bcachefs:add:no_slot"))
bf25974be5b42c Kent Overstreet 2025-10-04  794  				goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  795  
bf25974be5b42c Kent Overstreet 2025-10-04  796  			ret = bch2_sb_member_alloc(c);
bf25974be5b42c Kent Overstreet 2025-10-04  797  			if (ret < 0) {
bf25974be5b42c Kent Overstreet 2025-10-04  798  				prt_printf(err, "error allocating superblock member slot: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  799  				goto err;
bf25974be5b42c Kent Overstreet 2025-10-04  800  			}
bf25974be5b42c Kent Overstreet 2025-10-04  801  			unsigned dev_idx = ret;
bf25974be5b42c Kent Overstreet 2025-10-04  802  			ret = 0;
bf25974be5b42c Kent Overstreet 2025-10-04  803  
bf25974be5b42c Kent Overstreet 2025-10-04  804  			/* success: */
bf25974be5b42c Kent Overstreet 2025-10-04  805  
bf25974be5b42c Kent Overstreet 2025-10-04  806  			dev_mi.last_mount = cpu_to_le64(ktime_get_real_seconds());
bf25974be5b42c Kent Overstreet 2025-10-04  807  			*bch2_members_v2_get_mut(c->disk_sb.sb, dev_idx) = dev_mi;
bf25974be5b42c Kent Overstreet 2025-10-04  808  
bf25974be5b42c Kent Overstreet 2025-10-04  809  			ca->disk_sb.sb->dev_idx	= dev_idx;
bf25974be5b42c Kent Overstreet 2025-10-04  810  			bch2_dev_attach(c, ca, dev_idx);
bf25974be5b42c Kent Overstreet 2025-10-04  811  
bf25974be5b42c Kent Overstreet 2025-10-04  812  			set_bit(ca->dev_idx, c->online_devs.d);
bf25974be5b42c Kent Overstreet 2025-10-04  813  
bf25974be5b42c Kent Overstreet 2025-10-04  814  			if (BCH_MEMBER_GROUP(&dev_mi)) {
bf25974be5b42c Kent Overstreet 2025-10-04  815  				ret = __bch2_dev_group_set(c, ca, label.buf);
bf25974be5b42c Kent Overstreet 2025-10-04  816  				prt_printf(err, "error creating new label: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  817  				if (ret)
bf25974be5b42c Kent Overstreet 2025-10-04  818  					goto err_late;
bf25974be5b42c Kent Overstreet 2025-10-04  819  			}
bf25974be5b42c Kent Overstreet 2025-10-04  820  
bf25974be5b42c Kent Overstreet 2025-10-04  821  			bch2_write_super(c);
bf25974be5b42c Kent Overstreet 2025-10-04  822  		}
bf25974be5b42c Kent Overstreet 2025-10-04  823  
bf25974be5b42c Kent Overstreet 2025-10-04  824  		ret = bch2_dev_usage_init(ca, false);
bf25974be5b42c Kent Overstreet 2025-10-04  825  		if (ret)
bf25974be5b42c Kent Overstreet 2025-10-04  826  			goto err_late;
bf25974be5b42c Kent Overstreet 2025-10-04  827  
bf25974be5b42c Kent Overstreet 2025-10-04  828  		if (test_bit(BCH_FS_started, &c->flags)) {
bf25974be5b42c Kent Overstreet 2025-10-04  829  			ret = bch2_trans_mark_dev_sb(c, ca, BTREE_TRIGGER_transactional);
bf25974be5b42c Kent Overstreet 2025-10-04  830  			if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  831  				prt_printf(err, "error marking new superblock: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  832  				goto err_late;
bf25974be5b42c Kent Overstreet 2025-10-04  833  			}
bf25974be5b42c Kent Overstreet 2025-10-04  834  
bf25974be5b42c Kent Overstreet 2025-10-04  835  			ret = bch2_fs_freespace_init(c);
bf25974be5b42c Kent Overstreet 2025-10-04  836  			if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  837  				prt_printf(err, "error initializing free space: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  838  				goto err_late;
bf25974be5b42c Kent Overstreet 2025-10-04  839  			}
bf25974be5b42c Kent Overstreet 2025-10-04  840  
bf25974be5b42c Kent Overstreet 2025-10-04  841  			if (ca->mi.state == BCH_MEMBER_STATE_rw)
bf25974be5b42c Kent Overstreet 2025-10-04  842  				__bch2_dev_read_write(c, ca);
bf25974be5b42c Kent Overstreet 2025-10-04  843  
bf25974be5b42c Kent Overstreet 2025-10-04  844  			ret = bch2_dev_journal_alloc(ca, false);
bf25974be5b42c Kent Overstreet 2025-10-04  845  			if (ret) {
bf25974be5b42c Kent Overstreet 2025-10-04  846  				prt_printf(err, "error allocating journal: %s\n", bch2_err_str(ret));
bf25974be5b42c Kent Overstreet 2025-10-04  847  				goto err_late;
bf25974be5b42c Kent Overstreet 2025-10-04  848  			}
bf25974be5b42c Kent Overstreet 2025-10-04  849  		}
bf25974be5b42c Kent Overstreet 2025-10-04  850  
bf25974be5b42c Kent Overstreet 2025-10-04  851  		/*
bf25974be5b42c Kent Overstreet 2025-10-04  852  		 * We just changed the superblock UUID, invalidate cache and send a
bf25974be5b42c Kent Overstreet 2025-10-04  853  		 * uevent to update /dev/disk/by-uuid
bf25974be5b42c Kent Overstreet 2025-10-04  854  		 */
bf25974be5b42c Kent Overstreet 2025-10-04  855  		invalidate_bdev(ca->disk_sb.bdev);
bf25974be5b42c Kent Overstreet 2025-10-04  856  
bf25974be5b42c Kent Overstreet 2025-10-04  857  		char uuid_str[37];
bf25974be5b42c Kent Overstreet 2025-10-04  858  		snprintf(uuid_str, sizeof(uuid_str), "UUID=%pUb", &c->sb.uuid);
bf25974be5b42c Kent Overstreet 2025-10-04  859  
bf25974be5b42c Kent Overstreet 2025-10-04  860  		char *envp[] = {
bf25974be5b42c Kent Overstreet 2025-10-04  861  			"CHANGE=uuid",
bf25974be5b42c Kent Overstreet 2025-10-04  862  			uuid_str,
bf25974be5b42c Kent Overstreet 2025-10-04  863  			NULL,
bf25974be5b42c Kent Overstreet 2025-10-04  864  		};
bf25974be5b42c Kent Overstreet 2025-10-04  865  		kobject_uevent_env(&ca->disk_sb.bdev->bd_device.kobj, KOBJ_CHANGE, envp);
bf25974be5b42c Kent Overstreet 2025-10-04  866  	}
bf25974be5b42c Kent Overstreet 2025-10-04  867  out:
bf25974be5b42c Kent Overstreet 2025-10-04  868  	bch_err_fn(c, ret);
bf25974be5b42c Kent Overstreet 2025-10-04  869  	return ret;
bf25974be5b42c Kent Overstreet 2025-10-04  870  err:
bf25974be5b42c Kent Overstreet 2025-10-04  871  	if (ca)
bf25974be5b42c Kent Overstreet 2025-10-04  872  		bch2_dev_free(ca);
bf25974be5b42c Kent Overstreet 2025-10-04  873  	goto out;
bf25974be5b42c Kent Overstreet 2025-10-04  874  err_late:
bf25974be5b42c Kent Overstreet 2025-10-04  875  	ca = NULL;
bf25974be5b42c Kent Overstreet 2025-10-04  876  	goto err;
bf25974be5b42c Kent Overstreet 2025-10-04 @877  }
bf25974be5b42c Kent Overstreet 2025-10-04  878  

:::::: The code at line 877 was first introduced by commit
:::::: bf25974be5b42c0341a7f17cb7e6e835d80b41e6 bcachefs: split out init/dev.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
