Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A425217F27
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763972284; cv=none; b=FgmSquUND35bXONDiORsRQ4ccUs/N/FkFsd70NJ8Y0So7l9PrCyi2ugG0La88nwhflUD12WFHW9zs/NPjb11U8TWFNqw5fge8Vzld57x/jN09Zdm0qZK9jMN+KAx93OcBSxihTQGxfzQ61PnvNgQiB6BzwUcgSCwyJKFw4t0+/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763972284; c=relaxed/simple;
	bh=NMuJSbMzHMs+aDQJfTNp0WuwvrghKme0i3cjX3JdYi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRFLjM0FGnfT7lvd/MOLyiRTjeEMM1XDjuMr6MYXDAp5baTNeS3nTJY00En3uq4N5zIA0xBY/7wXpr7fEZmQp2zSq0Npi8O/2KM3ECTZGvInzZLA/4MZZVt3kMuzJ1+IdgiOQXijRwCr5evB+7zFYYsXTCmu2cKRrrdE44m16lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8CqvePV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8CqvePV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763972283; x=1795508283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NMuJSbMzHMs+aDQJfTNp0WuwvrghKme0i3cjX3JdYi4=;
  b=e8CqvePVfcdKX8tW9VkpyVMAtDV+rf1pO0az6krW5fTKiVw38QACS/bJ
   +aYkXRFU2WhyVkmBPFwosi7uan1zo8dA7ZENhS73AlUe+951ByG/SzNxV
   lze5OAn+/iZv+ypFPiHLzKGyk5ljeAHmcMeDrd1GFUJ+CcEgYvjdPNwHi
   Q59gghtotjPhCdzVj/rMEaw5C53gp8cuNkYv0eRiqLGusg5ycfWa/6y8l
   xhUpvkXoRqtxk01rX4iXehsxH+K3qjaNCMEPivG4dX06m8GdcP2pEHsog
   wyiYw8trqdYRhgCUYa8cbBhqLZWWS/eojBC1w6bebYFhNzXRvAuiCTfL5
   g==;
X-CSE-ConnectionGUID: ZEedMHO3TXiJ76FTn7RENQ==
X-CSE-MsgGUID: sH3tH+4jSjW6RS7A82bmQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77439766"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="77439766"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 00:17:56 -0800
X-CSE-ConnectionGUID: Y5hrnqrvSu6/mkrEoog4oA==
X-CSE-MsgGUID: qYv9beGXSmCHmlwnIjuH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192732493"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Nov 2025 00:17:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNRlf-000000000W7-1Ig4;
	Mon, 24 Nov 2025 08:17:51 +0000
Date: Mon, 24 Nov 2025 16:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-cleanup 5/12] fs/smb/client/cifsproto.h:717:22:
 error: invalid use of undefined type 'struct smb_message'
Message-ID: <202511241633.hl9R0XHB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-cleanup
head:   04f6c96ee8167c25e3e8403da23a09e8b926e88b
commit: 91c0e3d0504d7c22e7627285d75cf17642a36c4d [5/12] cifs: Rename mid_q_entry to smb_message
config: arc-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251124/202511241633.hl9R0XHB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241633.hl9R0XHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241633.hl9R0XHB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/smb/client/cifs_unicode.c:12:
   fs/smb/client/cifsproto.h:26:32: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      26 |                         struct TCP_Server_Info *server);
         |                                ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:37:22: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
      37 |               struct cifs_fattr *fattr, uint sidtype);
         |                      ^~~~~~~~~~
   fs/smb/client/cifsproto.h:36:52: warning: 'struct smb_sid' declared inside parameter list will not be visible outside of this definition or declaration
      36 | int sid_to_id(struct cifs_sb_info *cifs_sb, struct smb_sid *psid,
         |                                                    ^~~~~~~
   fs/smb/client/cifsproto.h:40:41: warning: 'struct smb_ace' declared inside parameter list will not be visible outside of this definition or declaration
      40 | unsigned int setup_authusers_ACE(struct smb_ace *pntace);
         |                                         ^~~~~~~
   fs/smb/client/cifsproto.h:41:44: warning: 'struct smb_ace' declared inside parameter list will not be visible outside of this definition or declaration
      41 | unsigned int setup_special_mode_ACE(struct smb_ace *pntace,
         |                                            ^~~~~~~
   fs/smb/client/cifsproto.h:44:50: warning: 'struct smb_ace' declared inside parameter list will not be visible outside of this definition or declaration
      44 | unsigned int setup_special_user_owner_ACE(struct smb_ace *pntace);
         |                                                  ^~~~~~~
   fs/smb/client/cifsproto.h:46:51: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
      46 |                                      const struct cifs_fid *cifsfid, u32 *pacllen,
         |                                                   ^~~~~~~~
   fs/smb/client/cifsproto.h:55:54: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
      55 |                       const char *path, const struct cifs_fid *pfid);
         |                                                      ^~~~~~~~
   fs/smb/client/cifsproto.h:53:60: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
      53 | int cifs_acl_to_fattr(struct cifs_sb_info *cifs_sb, struct cifs_fattr *fattr,
         |                                                            ^~~~~~~~~~
   fs/smb/client/cifsproto.h:67:51: warning: 'struct cifs_calc_sig_ctx' declared inside parameter list will not be visible outside of this definition or declaration
      67 |                           char *signature, struct cifs_calc_sig_ctx *ctx);
         |                                                   ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:66:57: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      66 | int __cifs_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
         |                                                         ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:68:50: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      68 | int cifs_sign_rqst(struct smb_rqst *rqst, struct TCP_Server_Info *server,
         |                                                  ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:70:56: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      70 | int cifs_sign_smbv(struct kvec *iov, int n_vec, struct TCP_Server_Info *server,
         |                                                        ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:72:52: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      72 | int cifs_sign_smb(struct smb_hdr *cifs_pdu, struct TCP_Server_Info *server,
         |                                                    ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:75:34: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      75 |                           struct TCP_Server_Info *server,
         |                                  ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:77:29: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
      77 | int setup_ntlmv2_rsp(struct cifs_ses *ses, const struct nls_table *nls_cp);
         |                             ^~~~~~~~
   fs/smb/client/cifsproto.h:78:24: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
      78 | int calc_seckey(struct cifs_ses *ses);
         |                        ^~~~~~~~
   fs/smb/client/cifsproto.h:79:41: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      79 | void cifs_crypto_secmech_release(struct TCP_Server_Info *server);
         |                                         ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:104:40: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     104 |                                 struct TCP_Server_Info *server);
         |                                        ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:103:40: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     103 | struct key *cifs_get_spnego_key(struct cifs_ses *sesInfo,
         |                                        ^~~~~~~~
   fs/smb/client/cifsproto.h:129:45: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     129 | void cifs_signal_cifsd_for_reconnect(struct TCP_Server_Info *server,
         |                                             ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:131:51: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     131 | void cifs_mark_tcp_ses_conns_for_reconnect(struct TCP_Server_Info *server,
         |                                                   ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:133:27: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     133 | int cifs_reconnect(struct TCP_Server_Info *server, bool mark_smb_session);
         |                           ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:134:34: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     134 | int cifs_read_from_socket(struct TCP_Server_Info *server, char *buf,
         |                                  ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:136:41: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     136 | ssize_t cifs_discard_from_socket(struct TCP_Server_Info *server, size_t to_read);
         |                                         ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:137:39: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     137 | int cifs_read_iter_from_socket(struct TCP_Server_Info *server, struct iov_iter *iter,
         |                                       ^~~~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:139:25: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     139 | void dequeue_mid(struct smb_message *mid, bool malformed);
         |                         ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:140:32: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     140 | int cifs_enable_signing(struct TCP_Server_Info *server, bool mnt_sign_required);
         |                                ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:141:65: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     141 | int cifs_handle_standard(struct TCP_Server_Info *server, struct smb_message *mid);
         |                                                                 ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:141:33: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     141 | int cifs_handle_standard(struct TCP_Server_Info *server, struct smb_message *mid);
         |                                 ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:148:41: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     148 | struct cifs_tcon *cifs_setup_ipc(struct cifs_ses *ses, bool seal);
         |                                         ^~~~~~~~
   fs/smb/client/cifsproto.h:149:32: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     149 | void __cifs_put_smb_ses(struct cifs_ses *ses);
         |                                ^~~~~~~~
   fs/smb/client/cifsproto.h:157:34: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     157 | void cifs_mount_put_conns(struct cifs_mount_ctx *mnt_ctx);
         |                                  ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:158:35: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     158 | int cifs_mount_get_session(struct cifs_mount_ctx *mnt_ctx);
         |                                   ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:159:32: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     159 | int cifs_mount_get_tcon(struct cifs_mount_ctx *mnt_ctx);
         |                                ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:160:32: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     160 | int cifs_is_path_remote(struct cifs_mount_ctx *mnt_ctx);
         |                                ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:179:67: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     179 | int dfs_parse_target_referral(const char *full_path, const struct dfs_info3_param *ref,
         |                                                                   ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:181:28: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     181 | int dfs_mount_share(struct cifs_mount_ctx *mnt_ctx);
         |                            ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:192:27: warning: 'struct dfs_cache_tgt_list' declared inside parameter list will not be visible outside of this definition or declaration
     192 |                    struct dfs_cache_tgt_list *tgt_list);
         |                           ^~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:191:56: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     191 |                    int remap, const char *path, struct dfs_info3_param *ref,
         |                                                        ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:194:33: warning: 'struct dfs_cache_tgt_list' declared inside parameter list will not be visible outside of this definition or declaration
     194 |                          struct dfs_cache_tgt_list *tgt_list);
         |                                 ^~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:193:51: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     193 | int dfs_cache_noreq_find(const char *path, struct dfs_info3_param *ref,
         |                                                   ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:195:68: warning: 'struct dfs_cache_tgt_iterator' declared inside parameter list will not be visible outside of this definition or declaration
     195 | void dfs_cache_noreq_update_tgthint(const char *path, const struct dfs_cache_tgt_iterator *it);
         |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:197:39: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     197 |                                struct dfs_info3_param *ref);
         |                                       ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:196:63: warning: 'struct dfs_cache_tgt_iterator' declared inside parameter list will not be visible outside of this definition or declaration
     196 | int dfs_cache_get_tgt_referral(const char *path, const struct dfs_cache_tgt_iterator *it,
         |                                                               ^~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:198:54: warning: 'struct dfs_cache_tgt_iterator' declared inside parameter list will not be visible outside of this definition or declaration
     198 | int dfs_cache_get_tgt_share(char *path, const struct dfs_cache_tgt_iterator *it, char **share,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:238:47: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     238 | struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fid *fid, struct file *file,
         |                                               ^~~~~~~~
   fs/smb/client/cifsproto.h:253:35: warning: 'struct cifsLockInfo' declared inside parameter list will not be visible outside of this definition or declaration
     253 | void cifs_del_lock_waiters(struct cifsLockInfo *lock);
         |                                   ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h:256:37: warning: 'struct cifsLockInfo' declared inside parameter list will not be visible outside of this definition or declaration
     256 |                              struct cifsLockInfo **conf_lock, int rw_check);
         |                                     ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h:266:46: warning: 'struct cifs_io_subrequest' declared inside parameter list will not be visible outside of this definition or declaration
     266 | void cifs_write_subrequest_terminated(struct cifs_io_subrequest *wdata, ssize_t result);
         |                                              ^~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:267:48: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     267 | struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *cifs_inode,
         |                                                ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:269:35: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     269 | int cifs_get_writable_file(struct cifsInodeInfo *cifs_inode, int flags,
         |                                   ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:271:48: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     271 | struct cifsFileInfo *find_writable_file(struct cifsInodeInfo *cifs_inode, int flags);
         |                                                ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:287:36: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     287 | bool is_size_safe_to_change(struct cifsInodeInfo *cifsInode, __u64 end_of_file,
         |                                    ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:308:53: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     308 | int cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr,
         |                                                     ^~~~~~~~~~
   fs/smb/client/cifsproto.h:310:56: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     310 | void cifs_fill_uniqueid(struct super_block *sb, struct cifs_fattr *fattr);
         |                                                        ^~~~~~~~~~
   fs/smb/client/cifsproto.h:311:38: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     311 | void cifs_unix_basic_to_fattr(struct cifs_fattr *fattr, FILE_UNIX_BASIC_INFO *info,
         |                                      ^~~~~~~~~~
   fs/smb/client/cifsproto.h:324:38: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     324 |                         const struct cifs_fid *fid);
         |                                      ^~~~~~~~
   fs/smb/client/cifsproto.h:322:32: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     322 |                         struct cifs_open_info_data *data,
         |                                ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:327:40: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     327 |                                 struct cifs_open_info_data *data,
--
         |                                                      ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:553:31: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     553 | void cifs_wake_up_task(struct smb_message *mid);
         |                               ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:555:24: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     555 | void delete_mid(struct smb_message *mid);
         |                        ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:564:47: warning: 'struct cifs_credits' declared inside parameter list will not be visible outside of this definition or declaration
     564 |                           size_t *num, struct cifs_credits *credits);
         |                                               ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h:565:62: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     565 | int wait_for_response(struct TCP_Server_Info *server, struct smb_message *midQ);
         |                                                              ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:567:21: error: unknown type name 'mid_receive_t'
     567 |                     mid_receive_t receive, mid_callback_t callback,
         |                     ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:567:44: error: unknown type name 'mid_callback_t'; did you mean 'bpf_callback_t'?
     567 |                     mid_receive_t receive, mid_callback_t callback,
         |                                            ^~~~~~~~~~~~~~
         |                                            bpf_callback_t
   fs/smb/client/cifsproto.h:568:21: error: unknown type name 'mid_handle_t'; did you mean 'irq_handler_t'?
     568 |                     mid_handle_t handle, void *cbdata, const int flags,
         |                     ^~~~~~~~~~~~
         |                     irq_handler_t
   fs/smb/client/cifsproto.h:570:33: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     570 | int cifs_sync_mid_result(struct smb_message *mid, struct TCP_Server_Info *server);
         |                                 ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:581:63: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     581 | int cifs_readv_receive(struct TCP_Server_Info *server, struct smb_message *mid);
         |                                                               ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:633:20: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     633 |             struct smb_message *smb)
         |                    ^~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'send_cancel':
   fs/smb/client/cifsproto.h:635:22: error: invalid use of undefined type 'struct TCP_Server_Info'
     635 |         return server->ops->send_cancel ?
         |                      ^~
   fs/smb/client/cifsproto.h:636:39: error: invalid use of undefined type 'struct TCP_Server_Info'
     636 |                                 server->ops->send_cancel(server, rqst, smb) : 0;
         |                                       ^~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:663:19: error: static declaration of 'cifs_inval_name_dfs_link_error' follows non-static declaration
     663 | static inline int cifs_inval_name_dfs_link_error(const unsigned int xid,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:445:5: note: previous declaration of 'cifs_inval_name_dfs_link_error' with type 'int(const unsigned int,  struct cifs_tcon *, struct cifs_sb_info *, const char *, bool *)' {aka 'int(const unsigned int,  struct cifs_tcon *, struct cifs_sb_info *, const char *, _Bool *)'}
     445 | int cifs_inval_name_dfs_link_error(const unsigned int xid,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'cifs_put_smb_ses':
   fs/smb/client/cifsproto.h:684:28: error: passing argument 1 of '__cifs_put_smb_ses' from incompatible pointer type [-Werror=incompatible-pointer-types]
     684 |         __cifs_put_smb_ses(ses);
         |                            ^~~
         |                            |
         |                            struct cifs_ses *
   fs/smb/client/cifsproto.h:149:42: note: expected 'struct cifs_ses *' but argument is of type 'struct cifs_ses *'
     149 | void __cifs_put_smb_ses(struct cifs_ses *ses);
         |                         ~~~~~~~~~~~~~~~~~^~~
   In file included from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from fs/smb/client/cifs_unicode.c:7:
   fs/smb/client/cifsproto.h: In function 'cifs_smb_ses_inc_refcount':
   fs/smb/client/cifsproto.h:697:30: error: 'cifs_tcp_ses_lock' undeclared (first use in this function); did you mean 'cifs_posix_lock'?
     697 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |                              ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:171:32: note: in definition of macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:9: note: in expansion of macro 'lockdep_assert'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:24: note: in expansion of macro 'lockdep_is_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:697:9: note: in expansion of macro 'lockdep_assert_held'
     697 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |         ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:697:30: note: each undeclared identifier is reported only once for each function it appears in
     697 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |                              ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:171:32: note: in definition of macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:9: note: in expansion of macro 'lockdep_assert'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:24: note: in expansion of macro 'lockdep_is_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:697:9: note: in expansion of macro 'lockdep_assert_held'
     697 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |         ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:698:12: error: invalid use of undefined type 'struct cifs_ses'
     698 |         ses->ses_count++;
         |            ^~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:715:39: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     715 | static inline void release_mid(struct smb_message *smb)
         |                                       ^~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'release_mid':
>> fs/smb/client/cifsproto.h:717:22: error: invalid use of undefined type 'struct smb_message'
     717 |         kref_put(&smb->refcount, __release_mid);
         |                      ^~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:720:47: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     720 | static inline void cifs_free_open_info(struct cifs_open_info_data *data)
         |                                               ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'cifs_free_open_info':
   fs/smb/client/cifsproto.h:722:19: error: invalid use of undefined type 'struct cifs_open_info_data'
     722 |         kfree(data->symlink_target);
         |                   ^~
   fs/smb/client/cifsproto.h:723:26: error: invalid use of undefined type 'struct cifs_open_info_data'
     723 |         free_rsp_buf(data->reparse.io.buftype, data->reparse.io.iov.iov_base);
         |                          ^~
   fs/smb/client/cifsproto.h:723:52: error: invalid use of undefined type 'struct cifs_open_info_data'
     723 |         free_rsp_buf(data->reparse.io.buftype, data->reparse.io.iov.iov_base);
         |                                                    ^~
   fs/smb/client/cifsproto.h:724:31: error: invalid application of 'sizeof' to incomplete type 'struct cifs_open_info_data'
     724 |         memset(data, 0, sizeof(*data));
         |                               ^
   cc1: some warnings being treated as errors


vim +717 fs/smb/client/cifsproto.h

   714	
   715	static inline void release_mid(struct smb_message *smb)
   716	{
 > 717		kref_put(&smb->refcount, __release_mid);
   718	}
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
