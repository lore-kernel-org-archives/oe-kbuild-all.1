Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0430B1BC20
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 02:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732675767; cv=none; b=k627CrrTWeB7Vzzr0/ni7hYwUV5DfR/4j6pIs7s0UMinuLobLm7hakzLurLMsZVuS/cSu4oDEQ4JhUQLV7hiiZ2ukooNA8sgUS8MsG74plJTRQ+S0k3L+NQlXM8zFJIwl+UB/ljz+oOEAitVnZeg6OtPPOYNuGIqvFk8M3bqZWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732675767; c=relaxed/simple;
	bh=mPSkn/TQdvpAN0gTct8VvMF4ksEguTu1s/PeqOhk/+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AsJ7BMUjFL9cuuH+ELWZCoQpOuxbYABpsHQosTJQnLOX1UDbjarivM6tKf38sfjZILemnayvhZ1NnJDsEJ1JRF9rjQSkpd/miV6at+kuJJsRuvkY9enwN6ZnuC+GIpKR1G78acfdM2frmxQJCFIY8HfqROi7h5iJwd4nhblCq1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjA7VUtX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjA7VUtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732675765; x=1764211765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mPSkn/TQdvpAN0gTct8VvMF4ksEguTu1s/PeqOhk/+o=;
  b=WjA7VUtX6A63UrGoLJ9CiQIJbmxxvs1Rqt7sn6mWreIOrLN4UOhZvMit
   Gb7CAY9pdTTDLspv5YIo/vlmyr2qOHfhfJKNPE99GXJzCYdTeucCVh+H5
   6WeUGOPeCqBLQvFrtNpV/sBGYasXxto2s/DOfGCY4qnwtpAjUvdK+iSuT
   Q0aWJ25BYJpNutpoh+pn5hE5mqathuwA2dy7kTMw8OtglLX30R9NaPZ/+
   NG/xCb8iXXENi7CgXtoZSB/Zjog7ljolQIUWtCYDuEPW6x6ksNYfJOj9B
   aXodRTOQ0nSm5SWfkEf9wcH5EelmajHBMyEWgMMT7lvkIru5Qa6qy1rAc
   w==;
X-CSE-ConnectionGUID: bZITC+nvQMGhCkKt+mmwaQ==
X-CSE-MsgGUID: Gn9x6ROkTZeMksJeJmTsig==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32996228"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="32996228"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 18:49:24 -0800
X-CSE-ConnectionGUID: JYHCJL3fSNKC+BSP8Q89Hg==
X-CSE-MsgGUID: aNujOXn7Q/aIIFqN7U02eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="96220261"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2024 18:49:23 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG87E-0007ft-36;
	Wed, 27 Nov 2024 02:49:20 +0000
Date: Wed, 27 Nov 2024 10:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 16/16] kernel/torture.o: warning:
 objtool: torture_shuffle_tasks+0xf7: Unkonwn annotation type: 8
Message-ID: <202411271003.gvcRMt1Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   cd9921a0bc2a79a77a7e1f03f84491760d88b6a8
commit: cd9921a0bc2a79a77a7e1f03f84491760d88b6a8 [16/16] objtool: Warn about unknown annotation types
config: x86_64-randconfig-004-20241127 (https://download.01.org/0day-ci/archive/20241127/202411271003.gvcRMt1Y-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271003.gvcRMt1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271003.gvcRMt1Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/torture.o: warning: objtool: torture_offline+0x136: Unkonwn annotation type: 8
   kernel/torture.o: warning: objtool: torture_online+0x178: Unkonwn annotation type: 8
>> kernel/torture.o: warning: objtool: torture_shuffle_tasks+0xf7: Unkonwn annotation type: 8
   kernel/torture.o: warning: objtool: torture_shuffle_task_register+0x9f: Unkonwn annotation type: 8
   kernel/torture.o: warning: objtool: torture_onoff+0x25b: Unkonwn annotation type: 8
--
   samples/ftrace/ftrace-ops.o: warning: objtool: ops_alloc_init+0xaa: Unkonwn annotation type: 8
>> samples/ftrace/ftrace-ops.o: warning: objtool: ftrace_ops_sample_exit+0xc0: Unkonwn annotation type: 8
>> samples/ftrace/ftrace-ops.o: warning: objtool: ftrace_ops_sample_init+0x35d: Unkonwn annotation type: 8
--
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_enter+0x59: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_err+0x5b: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_done+0x59: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_tcon_ref.constprop.0+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_reconnect+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_connect_err+0x5e: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_connect_done+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_hdr_credits+0x61: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_enter+0x59: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_err+0x5b: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_done+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_tcon_ref+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_match_ipaddr+0x1d: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: match_server+0x11f: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_put_tcp_session+0x14b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: __cifs_put_smb_ses+0x2f0: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_put_tcon+0x16e: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_mount_get_tcon+0x253: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_get_smb_ses+0x4d2: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_mount_get_session+0xc1: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_mount+0x1ad: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_mknod_enter+0x5e: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_mknod_err+0x5e: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_mknod_done+0x5b: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_enter+0x59: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_err+0x5b: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_done+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_cifs_flush_err+0x59: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_netfs_sreq+0x59: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_enter+0x59: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_err+0x5b: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_done+0x59: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_rw_credits+0x6b: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_cifs_fsync_err+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_init_request+0xde: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_new_fileinfo+0x5f8: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_open+0x607: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_enter+0x59: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_err+0x5b: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_done+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_revalidate_file_attr+0x66: Unkonwn annotation type: 8
>> fs/smb/client/cifs.o: warning: objtool: trace_smb3_enter+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_err+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_done+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_tcon_ref+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: copy_path_name+0x25: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_slow_rsp+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_partial_send_reconnect+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_waitff_credits+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_credit_timeout+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_nblk_credits.constprop.0+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_insufficient_credits.constprop.0+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: smb_send_rqst+0x12f: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_shash_iter+0x621: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_done.constprop.0+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_enter.constprop.0+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_err.constprop.0+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_filldir.constprop.0+0x490: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_readdir+0x5e6: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_dump_full_key+0x29a: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_shutdown_enter+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_shutdown_done+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_ioctl+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_shutdown_err.constprop.0+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_done.constprop.0+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_enter.constprop.0+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_err.constprop.0+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: ascii_ssetup_strings.constprop.0+0x1a9: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_done.constprop.0+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_enter.constprop.0+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_err.constprop.0+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: size_of_ntlmssp_blob+0xf0: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: build_ntlmssp_auth_blob.part.0+0x2ee: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: cifs_ses_add_channel+0x59c: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: CIFS_SessSetup+0x178: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: handle_read_data+0x314: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_copychunk_enter+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_copychunk_done+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_qfs_done+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_ses_expired+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_pend_credits+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_set_credits+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_overflow_credits+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_reconnect_with_invalid_credits+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_add_credits+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_adj_credits+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_wait_credits+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: smb3_notify+0x279: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: smb3_enum_snapshots+0x174: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_ses_not_found+0x57: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: smb2_aead_req_alloc+0x81: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_zero_enter+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_zero_err+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_zero_done+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_falloc_enter+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_falloc_done+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_clone_enter+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_clone_err+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_clone_done+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_enter+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_err+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_exit_done+0x59: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_tcon_ref+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: smb2_get_dfs_refer+0x3cf: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_rw_credits+0x6b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_reconnect_detected+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: smb2_add_credits+0x271: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_falloc_err+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_too_many_credits.constprop.0+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_query_dir_done.constprop.0+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_query_dir_err.constprop.0+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: receive_encrypted_standard+0x1b0: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: parse_server_interfaces+0x32c: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: smb2_ioctl_query_info+0x80b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_cmd_done+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_cmd_err+0x64: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_ses_not_found+0x57: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_cmd_enter+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_tcon_ref.constprop.0+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: smb2_find_smb_tcon+0x15f: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_lease_not_found+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_tcon_ref+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_oplock_not_found.constprop.0+0x5e: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: __smb2_handle_cancelled_cmd+0xdb: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: smb2_handle_cancelled_close+0x127: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_key_expired+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_tcon+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_tdis_enter+0x5e: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_tdis_err+0x5e: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_tdis_done+0x5b: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_open_enter+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_open_err+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_open_done+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_close_enter+0x5e: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_close_err+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_close_done+0x5e: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_query_info_enter+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_query_info_err+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_query_info_done+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_notify_enter+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_notify_err+0x61: Unkonwn annotation type: 8
   fs/smb/client/cifs.o: warning: objtool: trace_smb3_notify_done+0x61: Unkonwn annotation type: 8
--
>> kernel/rcu/rcuscale.o: warning: objtool: rcu_scale_reader+0x89: Unkonwn annotation type: 2
   kernel/rcu/rcuscale.o: warning: objtool: srcu_scale_read_unlock+0x45: Unkonwn annotation type: 8
   kernel/rcu/rcuscale.o: warning: objtool: rcu_scale_cleanup+0x497: Unkonwn annotation type: 8
   kernel/rcu/rcuscale.o: warning: objtool: rcu_scale_writer+0x30a: Unkonwn annotation type: 8
--
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_reader_do_mbchk+0x1a6: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_fakewriter+0x201: Unkonwn annotation type: 2
   kernel/rcu/rcutorture.o: warning: objtool: rcu_nocb_toggle+0x183: Unkonwn annotation type: 8
>> kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_stall_one+0x218: Unkonwn annotation type: 2
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_barrier+0x186: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: synchronize_rcu_trivial+0x8e: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: srcu_torture_init+0x55: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: do_rtws_sync.constprop.0+0x196: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_mem_dump_obj+0x249: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_stats_print+0x5f5: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcutorture_extend_mask+0xe5: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcutorture_oom_notify+0x43: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: srcu_torture_read_lock+0x1bb: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: srcu_torture_read_unlock+0x73: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcutorture_one_extend+0x7d: Unkonwn annotation type: 2
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_writer+0x558: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_one_read+0x308: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_fwd_prog_nr+0x282: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_fwd_prog_cr+0x38f: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_fwd_prog+0x20c: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_cleanup+0x672: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_init_srcu_lockdep+0x48f: Unkonwn annotation type: 8
   kernel/rcu/rcutorture.o: warning: objtool: rcu_torture_init+0xa5e: Unkonwn annotation type: 8
--
>> kernel/rcu/refscale.o: warning: objtool: seqcount_lockdep_reader_access+0x13: Unkonwn annotation type: 2
   kernel/rcu/refscale.o: warning: objtool: srcu_ref_scale_delay_section+0xd3: Unkonwn annotation type: 8
   kernel/rcu/refscale.o: warning: objtool: ref_scale_reader+0x231: Unkonwn annotation type: 2
   kernel/rcu/refscale.o: warning: objtool: srcu_ref_scale_read_section+0xb6: Unkonwn annotation type: 8
   kernel/rcu/refscale.o: warning: objtool: main_func+0x6a3: Unkonwn annotation type: 8
   kernel/rcu/refscale.o: warning: objtool: typesafe_delay_section+0x30a: Unkonwn annotation type: 8
   kernel/rcu/refscale.o: warning: objtool: ref_scale_init+0x458: Unkonwn annotation type: 8
   kernel/rcu/refscale.o: warning: objtool: typesafe_init+0x180: Unkonwn annotation type: 8
--
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_setup_sequence+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_close+0x5e: Unkonwn annotation type: 8
>> fs/nfs/nfsv4.o: warning: objtool: seqcount_lockdep_reader_access+0x13: Unkonwn annotation type: 2
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_lookup_root+0x5e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_fsinfo+0x5e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_getattr+0x5e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_lookup+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_setclientid+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_setclientid_confirm+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_delegreturn_exit+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_delegreturn+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_set_lock+0x61: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_get_fs_locations+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_secinfo+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_renew_async+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_setattr+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_open_file+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_commit+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_write+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_read+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_mknod+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_readdir+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_mkdir+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_symlink+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_readlink+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_access+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_lookupp+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_set_acl+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_get_acl+0x59: Unkonwn annotation type: 8
>> fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_cached_open+0x57: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_close_stateid_update_wait.constprop.0+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_open_stateid_update.constprop.0+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_unlock.constprop.0+0x5e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_get_lock.constprop.0+0x5e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_open_expired.constprop.0+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_open_reclaim.constprop.0+0x5b: Unkonwn annotation type: 8
>> fs/nfs/nfsv4.o: warning: objtool: nfs4_proc_rmdir+0xc5: Unkonwn annotation type: 8
>> fs/nfs/nfsv4.o: warning: objtool: nfs4_proc_remove+0xe1: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_xdr_bad_operation+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_xdr_status+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: xdr_encode_bitmap4+0x8d: Unkonwn annotation type: 8
>> fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_xdr_bad_filehandle.constprop.0+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: encode_compound_hdr.constprop.0+0x8c: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_release_lockowner+0x9f: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: encode_putfh+0x6c: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_server_caps+0xb3: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_renew+0xaf: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_readlink+0xc5: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_commit+0xc7: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_remove+0xd8: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_secinfo+0xdb: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: encode_getattr+0xa2: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_get_lease_time+0xc5: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_statfs+0xa0: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_pathconf+0xa0: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_lookup_root+0xe9: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_getattr+0xa0: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_fsinfo+0xa0: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_setclientid_confirm+0xd6: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_access+0xf4: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_lookupp+0xf8: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_lockt+0x126: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_setattr+0x118: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_read+0x12c: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_lookup+0x13a: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_write+0x159: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_setacl+0x14d: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_rename+0x14e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_link+0x16f: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: encode_readdir.constprop.0+0x1c8: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_readdir+0xb4: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_create+0x204: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: encode_setclientid+0x15b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_setclientid+0x81: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_getacl+0x114: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_fsid_present+0xf9: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_open_confirm+0x11e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_delegreturn+0x214: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_close+0x142: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_open_downgrade+0x143: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_locku+0x1b9: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_fs_locations+0x1be: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: encode_open+0x3ec: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_open_noattr+0x123: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_open+0x169: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_xdr_enc_lock+0x2b8: Unkonwn annotation type: 8
>> fs/nfs/nfsv4.o: warning: objtool: seqcount_lockdep_reader_access+0x13: Unkonwn annotation type: 2
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_state_mgr+0x57: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_state_lock_reclaim+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_state_mgr_failed+0x5b: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_file_open+0x198: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_reclaim_delegation+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_set_delegation+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_map_name_to_uid+0x5e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_map_group_to_gid+0x5e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_map_uid_to_name+0x5e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_map_gid_to_group+0x5e: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs_idmap_legacy_upcall+0xec: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs_cb_no_clp+0x59: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: trace_nfs_cb_badprinc+0x59: Unkonwn annotation type: 8
>> fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_cb_getattr+0x5e: Unkonwn annotation type: 8
>> fs/nfs/nfsv4.o: warning: objtool: trace_nfs4_cb_recall+0x61: Unkonwn annotation type: 8
   fs/nfs/nfsv4.o: warning: objtool: nfs4_alloc_client+0x39c: Unkonwn annotation type: 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
