Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B4A7C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 04:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679371212; x=1710907212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q0hX40nV6rdmJ9OmxZGVRXPnorg6ovt3A3Dt8fmXZtA=;
  b=V6Bc2Dcxf8ORkVjhyg8jiEgVV9tpjBpKuei/YFSTZ61HA/P5bCR3kVyR
   of25qYut/qNWqym4VEUaibrnHncolyIXh8fF3RSoA4esy4f3Imw/pEVdg
   XdOf6hlW/FPjANBYDKqPyrkr919ocfpDrGQQWiegDP7EE3J0Hxad+xQPM
   JT0d14hUhcfnw3CaaSwydVuQX8pOnmue92ODVej9zY3MlCP64VRrSPDTM
   E6HgSBsiQyCIIcqpqTvXKTUjNsJ33+qtxdTopE/Kvkldg1dOT8tkdymg3
   F4q0uOIT9aMq7TF2aGOXMnNyl1vvLhoLcCz6teMgzLg8DdgiYUEGs7e64
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318492880"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="318492880"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 21:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="791901980"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="791901980"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2023 21:00:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peTAP-000BZd-25;
	Tue, 21 Mar 2023 04:00:09 +0000
Date: Tue, 21 Mar 2023 11:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>
Subject: [ceph-client:testing 19/80] fs/ceph/super.c:1122:15: error: implicit
 declaration of function 'fscrypt_add_test_dummy_key'
Message-ID: <202303211100.ExmaGnB0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ceph/ceph-client.git testing
head:   bc74c6176640bed8ff55211d4211658413f5c19c
commit: 72326544b6f873e44659da920b51572bdf76b143 [19/80] ceph: implement -o test_dummy_encryption mount option
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20230321/202303211100.ExmaGnB0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ceph/ceph-client/commit/72326544b6f873e44659da920b51572bdf76b143
        git remote add ceph-client https://github.com/ceph/ceph-client.git
        git fetch --no-tags ceph-client testing
        git checkout 72326544b6f873e44659da920b51572bdf76b143
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash fs/ceph/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211100.ExmaGnB0-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/super.c: In function 'ceph_apply_test_dummy_encryption':
>> fs/ceph/super.c:1122:15: error: implicit declaration of function 'fscrypt_add_test_dummy_key' [-Werror=implicit-function-declaration]
    1122 |         err = fscrypt_add_test_dummy_key(sb, &fsc->fsc_dummy_enc_policy);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/fscrypt_add_test_dummy_key +1122 fs/ceph/super.c

  1088	
  1089	#ifdef CONFIG_FS_ENCRYPTION
  1090	static int ceph_apply_test_dummy_encryption(struct super_block *sb,
  1091						    struct fs_context *fc,
  1092						    struct ceph_mount_options *fsopt)
  1093	{
  1094		struct ceph_fs_client *fsc = sb->s_fs_info;
  1095		int err;
  1096	
  1097		if (!fscrypt_is_dummy_policy_set(&fsopt->dummy_enc_policy))
  1098			return 0;
  1099	
  1100		/* No changing encryption context on remount. */
  1101		if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
  1102		    !fscrypt_is_dummy_policy_set(&fsc->fsc_dummy_enc_policy)) {
  1103			if (fscrypt_dummy_policies_equal(&fsopt->dummy_enc_policy,
  1104							 &fsc->fsc_dummy_enc_policy))
  1105				return 0;
  1106			errorfc(fc, "Can't set test_dummy_encryption on remount");
  1107			return -EINVAL;
  1108		}
  1109	
  1110		/* Also make sure fsopt doesn't contain a conflicting value. */
  1111		if (fscrypt_is_dummy_policy_set(&fsc->fsc_dummy_enc_policy)) {
  1112			if (fscrypt_dummy_policies_equal(&fsopt->dummy_enc_policy,
  1113							 &fsc->fsc_dummy_enc_policy))
  1114				return 0;
  1115			errorfc(fc, "Conflicting test_dummy_encryption options");
  1116			return -EINVAL;
  1117		}
  1118	
  1119		fsc->fsc_dummy_enc_policy = fsopt->dummy_enc_policy;
  1120		memset(&fsopt->dummy_enc_policy, 0, sizeof(fsopt->dummy_enc_policy));
  1121	
> 1122		err = fscrypt_add_test_dummy_key(sb, &fsc->fsc_dummy_enc_policy);
  1123		if (err) {
  1124			errorfc(fc, "Error adding test dummy encryption key, %d", err);
  1125			return err;
  1126		}
  1127	
  1128		warnfc(fc, "test_dummy_encryption mode enabled");
  1129		return 0;
  1130	}
  1131	#else
  1132	static int ceph_apply_test_dummy_encryption(struct super_block *sb,
  1133						    struct fs_context *fc,
  1134						    struct ceph_mount_options *fsopt)
  1135	{
  1136		return 0;
  1137	}
  1138	#endif
  1139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
