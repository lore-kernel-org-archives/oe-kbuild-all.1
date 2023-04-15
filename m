Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320427EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681540520; x=1713076520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7V2EPRwX7jixmF8goCAGaeZKWpgOUcDIZp2WOkApyaM=;
  b=DopAwHtOHoaAZCWHtcpi2ALLgzf7uTTWqvREV3SeIF00Mm15l3bFjPkQ
   sWhHDeKL48xD8sCqhUvPvJeVqeY8HvMmna4NjX9ji6HT2ELuPPaOTiG4y
   MNcMz2Ja6gE1fi5dFZ1QKS8BqaSlAa46BhsYD5eEmnuM1s3MO4+vFqAjh
   /M3tTaoU2Ry5lhhPErTxyBCfkSQQIJ2T+ipyx0q9N+qroksAp1pL1eurq
   HqKQDcO71YtEknMXAkrsTftu9kmg2oUjnIwviH+D1tZzgucGHAAwFdz7K
   y1yjuSjaiy12W3Hmnku82V9nidLNTYKse4s5gdkxfM7r5Px02/dLiURYK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="328777573"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="328777573"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 23:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779481668"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="779481668"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 23:35:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnZVF-000abY-1I;
	Sat, 15 Apr 2023 06:35:17 +0000
Date: Sat, 15 Apr 2023 14:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-debug 8/8] crypto/gcm.o: warning: objtool:
 crypto_rfc4543_copy_src_to_dst() falls through to next function
 crypto_rfc4543_crypt()
Message-ID: <202304151425.wzggZ4AK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-debug
head:   e98151beddae6d081bff7091b31f5a31c1b89b02
commit: e98151beddae6d081bff7091b31f5a31c1b89b02 [8/8] objtool: Move list of noreturn functions to separate file
config: x86_64-randconfig-a013-20230410 (https://download.01.org/0day-ci/archive/20230415/202304151425.wzggZ4AK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=e98151beddae6d081bff7091b31f5a31c1b89b02
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-debug
        git checkout e98151beddae6d081bff7091b31f5a31c1b89b02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash M=crypto/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151425.wzggZ4AK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/gcm.o: warning: objtool: crypto_rfc4543_copy_src_to_dst() falls through to next function crypto_rfc4543_crypt()
>> crypto/gcm.o: warning: objtool: crypto_gcm_create() falls through to next function crypto_gcm_base_create()
--
>> crypto/ccm.o: warning: objtool: crypto_ccm_create() falls through to next function crypto_ccm_base_create()
--
>> drivers/net/virtio_net.o: warning: objtool: virtnet_get_drvinfo() falls through to next function virtnet_tx_timeout()
--
>> fs/nfs/nfsv4.o: warning: objtool: nfs4_get_uniquifier.constprop.0() falls through to next function nfs4_init_uniform_client_string()
>> fs/nfs/nfsv4.o: warning: objtool: nfs4_init_nonuniform_client_string() falls through to next function _nfs4_proc_getlk.constprop.0()
>> fs/nfs/nfsv4.o: warning: objtool: nfs4_schedule_state_manager() falls through to next function nfs40_discover_server_trunking()
>> fs/nfs/nfsv4.o: warning: objtool: nfs4_set_ds_client() falls through to next function nfs4_set_client()
--
>> fs/cifs/cifs.o: warning: objtool: cifs_get_link() falls through to next function cifs_setlease()
>> fs/cifs/cifs.o: warning: objtool: cifs_query_mf_symlink() falls through to next function cifs_create_mf_symlink()
>> fs/cifs/cifs.o: warning: objtool: smb3_create_mf_symlink() falls through to next function cifs_hardlink()
>> fs/cifs/cifs.o: warning: objtool: smb_send() falls through to next function cifs_wait_mtu_credits()
>> fs/cifs/cifs.o: warning: objtool: cifs_sign_smbv() falls through to next function cifs_sign_smb()
>> fs/cifs/cifs.o: warning: objtool: calc_seckey() falls through to next function cifs_crypto_secmech_release()
>> fs/cifs/cifs.o: warning: objtool: cifs_fill_dirent() falls through to next function cifs_prime_dcache()
>> fs/cifs/cifs.o: warning: objtool: smb2_is_path_accessible() falls through to next function smb2_new_lease_key()
>> fs/cifs/cifs.o: warning: objtool: smb2_qfs_tcon() falls through to next function smb2_get_dfs_refer()
>> fs/cifs/cifs.o: warning: objtool: smb3_qfs_tcon() falls through to next function smb2_set_related()
>> fs/cifs/cifs.o: warning: objtool: smb311_queryfs() falls through to next function smb3_free_compound_rqst()
>> fs/cifs/cifs.o: warning: objtool: SMB2_sess_sendreceive() falls through to next function smb2_echo_callback()
>> fs/cifs/cifs.o: warning: objtool: cifs_open_file() falls through to next function check2ndT2()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
