Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AA32F90E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365914; cv=none; b=U42up4eKofgEOxPwr+59SPwg7LBvQHf3/Ls7NWsw59jhGjqgEls2FZdCS/2F+7hkRcEsKu9lGvEt9AF8L3ojvqyRmN0Q70p/6nB58wOw/HOO8TpUC47Js8PscBovvR1TdY571LKTsavvv18bZM92xxnLKkrKRoXprlutbEpbyNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365914; c=relaxed/simple;
	bh=+dSb1r5LWPiIu17VQi/or2BwNcn3l119bqnpKgAJrRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swCJMrM1eF0kSIn+OB3VZwOiNISRY9XF9TaY5TUvTDw4v3EuZ1JFgaRwr1io1ouEwyJFFhbc8EOucG0qeRngS9V8O/NgkMjk5mkD70nO+nq/v+rYTQhxJof53uZDveMZ+hHElhMJy241u1XDnhyWd5D3JKLUPHglHffsJWTXSwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZKPXDc+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZKPXDc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765365913; x=1796901913;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+dSb1r5LWPiIu17VQi/or2BwNcn3l119bqnpKgAJrRo=;
  b=UZKPXDc+2SXND0dTk0LH+/teRIuHyTtPteOJeLd72HzarkmPXetDUfFT
   HEX4tK4uU5xCqp0vrQtbjxp3KHTOHWnOt3pF281M/SJjB3muVgIkBxPr7
   5Q0PMJwE+APE63V7rRL+kC5esia1816dm+ibaC6dPP979sV2qBAWO47Ua
   4SHQG0YqHMAMnugDoZFNH0hfHZ91DKFJIn/rJMaFBT/W4dA0KcMIWG+Br
   5nxVZGQI2myC7kbWvh2F6Pc3OQCapaNoQVkpS/fmOSOnbNhEpsiadBd9e
   bcyBZez4zR30GCqXOlHLKTA7yDGxPi+/k7BDaeW6Jog7yTZsVBaqnE2Db
   w==;
X-CSE-ConnectionGUID: 1cxkl7H7R4mJSgIk9bqBmw==
X-CSE-MsgGUID: KYKPVcb2QEOOm56QoXUZmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78447004"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="78447004"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 03:25:13 -0800
X-CSE-ConnectionGUID: f4ZJ7jHKTQ+/6Zks+3tFDA==
X-CSE-MsgGUID: aIpDajE8SrajEnA+gKMPyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="227146710"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2025 03:25:12 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTIJh-00000000385-20qn;
	Wed, 10 Dec 2025 11:25:09 +0000
Date: Wed, 10 Dec 2025 19:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/1] fs/smb/server/misc.c:269:
 warning: Function parameter or member 'um' not described in
 'ksmbd_extract_sharename'
Message-ID: <202512101922.KYpEtH7k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   0ac176d7ef4de55cd6a1c781a92212aa6ef316f8
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [0/1] smb: move client and server files to common directory fs/smb
config: x86_64-randconfig-104-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101922.KYpEtH7k-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101922.KYpEtH7k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101922.KYpEtH7k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/misc.c:269: warning: Function parameter or member 'um' not described in 'ksmbd_extract_sharename'
--
   fs/smb/server/auth.c:221: warning: Function parameter or member 'conn' not described in 'ksmbd_auth_ntlmv2'
>> fs/smb/server/auth.c:221: warning: Function parameter or member 'cryptkey' not described in 'ksmbd_auth_ntlmv2'
>> fs/smb/server/auth.c:305: warning: Function parameter or member 'blob_len' not described in 'ksmbd_decode_ntlmssp_auth_blob'
>> fs/smb/server/auth.c:305: warning: Function parameter or member 'conn' not described in 'ksmbd_decode_ntlmssp_auth_blob'
>> fs/smb/server/auth.c:305: warning: Excess function parameter 'usr' description in 'ksmbd_decode_ntlmssp_auth_blob'
   fs/smb/server/auth.c:382: warning: Function parameter or member 'blob_len' not described in 'ksmbd_decode_ntlmssp_neg_blob'
   fs/smb/server/auth.c:382: warning: Function parameter or member 'conn' not described in 'ksmbd_decode_ntlmssp_neg_blob'
   fs/smb/server/auth.c:382: warning: Excess function parameter 'rsp' description in 'ksmbd_decode_ntlmssp_neg_blob'
   fs/smb/server/auth.c:382: warning: Excess function parameter 'sess' description in 'ksmbd_decode_ntlmssp_neg_blob'
   fs/smb/server/auth.c:410: warning: Function parameter or member 'conn' not described in 'ksmbd_build_ntlmssp_challenge_blob'
>> fs/smb/server/auth.c:410: warning: Excess function parameter 'rsp' description in 'ksmbd_build_ntlmssp_challenge_blob'
   fs/smb/server/auth.c:410: warning: Excess function parameter 'sess' description in 'ksmbd_build_ntlmssp_challenge_blob'
--
>> fs/smb/server/transport_tcp.c:373: warning: Function parameter or member 'max_retries' not described in 'ksmbd_tcp_read'
   fs/smb/server/transport_tcp.c:422: warning: Function parameter or member 'iface' not described in 'create_socket'
--
   fs/smb/server/vfs.c:74: warning: Function parameter or member 'user_ns' not described in 'ksmbd_vfs_lock_parent'
   fs/smb/server/vfs.c:74: warning: Function parameter or member 'parent' not described in 'ksmbd_vfs_lock_parent'
>> fs/smb/server/vfs.c:74: warning: Function parameter or member 'child' not described in 'ksmbd_vfs_lock_parent'
   fs/smb/server/vfs.c:366: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_read'
>> fs/smb/server/vfs.c:366: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_read'
>> fs/smb/server/vfs.c:482: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_write'
>> fs/smb/server/vfs.c:482: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_write'
   fs/smb/server/vfs.c:545: warning: Function parameter or member 'path' not described in 'ksmbd_vfs_getattr'
>> fs/smb/server/vfs.c:545: warning: Function parameter or member 'stat' not described in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Excess function parameter 'work' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Excess function parameter 'attrs' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:562: warning: Function parameter or member 'p_id' not described in 'ksmbd_vfs_fsync'
>> fs/smb/server/vfs.c:585: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_remove_file'
   fs/smb/server/vfs.c:645: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_link'
   fs/smb/server/vfs.c:846: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_truncate'
   fs/smb/server/vfs.c:846: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_truncate'
>> fs/smb/server/vfs.c:887: warning: Excess function parameter 'size' description in 'ksmbd_vfs_listxattr'
   fs/smb/server/vfs.c:964: warning: Function parameter or member 'attr_name' not described in 'ksmbd_vfs_setxattr'
   fs/smb/server/vfs.c:964: warning: Function parameter or member 'attr_value' not described in 'ksmbd_vfs_setxattr'
   fs/smb/server/vfs.c:964: warning: Function parameter or member 'attr_size' not described in 'ksmbd_vfs_setxattr'
   fs/smb/server/vfs.c:964: warning: Excess function parameter 'name' description in 'ksmbd_vfs_setxattr'
   fs/smb/server/vfs.c:964: warning: Excess function parameter 'value' description in 'ksmbd_vfs_setxattr'
   fs/smb/server/vfs.c:964: warning: Excess function parameter 'size' description in 'ksmbd_vfs_setxattr'
   fs/smb/server/vfs.c:984: warning: Function parameter or member 'option' not described in 'ksmbd_vfs_set_fadvise'
   fs/smb/server/vfs.c:984: warning: Excess function parameter 'options' description in 'ksmbd_vfs_set_fadvise'
>> fs/smb/server/vfs.c:1180: warning: Function parameter or member 'um' not described in 'ksmbd_vfs_lookup_in_dir'
   fs/smb/server/vfs.c:1214: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_kern_path'


vim +269 fs/smb/server/misc.c

16b5f54e30c1dde fs/ksmbd/misc.c Atte Heikkilä    2022-09-15  261  
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  262  /**
36ba38663be0a1b fs/cifsd/misc.c Stephen Rothwell 2021-03-17  263   * ksmbd_extract_sharename() - get share name from tree connect request
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  264   * @treename:	buffer containing tree name and share name
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  265   *
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  266   * Return:      share name on success, otherwise error
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  267   */
16b5f54e30c1dde fs/ksmbd/misc.c Atte Heikkilä    2022-09-15  268  char *ksmbd_extract_sharename(struct unicode_map *um, const char *treename)
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16 @269  {
16b5f54e30c1dde fs/ksmbd/misc.c Atte Heikkilä    2022-09-15  270  	const char *name = treename, *pos = strrchr(name, '\\');
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  271  
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  272  	if (pos)
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  273  		name = (pos + 1);
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  274  
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  275  	/* caller has to free the memory */
f5ba1cdaf5eb380 fs/ksmbd/misc.c Atte Heikkilä    2022-10-03  276  	return ksmbd_casefold_sharename(um, name);
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  277  }
e2f34481b24db2f fs/cifsd/misc.c Namjae Jeon      2021-03-16  278  

:::::: The code at line 269 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
