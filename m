Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2E2E0916
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967836; cv=none; b=O+97S0peycJBxB6uputtWq2sIdq6h8Lp2KJ8EEoZ8bf812tWyQJzye6vxQA++MaKKkyasVPF+iJWIgLUQDqvrNXfyLYLoQGdVtE5zdEPKwneGFle3rI6M0e9XyWomx9YgIvGtvDDOCUyexoGv2kjpxWUrzfrrIIi0uc9dVdh3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967836; c=relaxed/simple;
	bh=R+Md7Nneidre78EPpOTerMBI2RXiuuwh3L+56hDrrOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X2hhvBsseCxsoPb2JZq1mFVIMlhGZCzappoK66HQoRCibU644WcP2mV6mJ89bxA9JHVX3WQnbMGUft6nA3xl6iieG4URcQRaGZcUohBv5n+5woxa5bJ0L0GwYw9SZp8NcS7sRK91TtLWItuDj+/icmIjJlYyz3YbvYzoN1B/1n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9hwCe0S; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9hwCe0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763967833; x=1795503833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R+Md7Nneidre78EPpOTerMBI2RXiuuwh3L+56hDrrOc=;
  b=j9hwCe0SWp5ywVtH1/pKEZ1qRn+IBYiKJFRaUv/CgQHYFgn6RXGi+TzM
   oSc1Nhy5fr5JKikoDscuNuRlXlVZCFLf7fAZ7cmMSUwQkBTF/lISHyROd
   YnWl8DNZ9D7QKiexw0b+6/NnJn3PBZGHqTwZtqIDJv9Lnfbkg1tmh+3Z8
   rBzNSGcanBy5kuclsEKc2UTnuhOKdmx02RmyuSS9Tu523947jNAvLhb63
   ac81Cjs2AZMRcK38b7Poq8JZ63yVXdEId5SAiG6bFktScL9/lq7Fg5GuT
   31ntWZmC49rsk+YgmMnti8yBd1qswMRZxZRb+IYWk9u3t4/tGCwAFmmXk
   A==;
X-CSE-ConnectionGUID: OtTppeDbTW2WfRa2QpHvhA==
X-CSE-MsgGUID: 4yXGpweoRhCUKEwRF7PxqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76287241"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="76287241"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:03:51 -0800
X-CSE-ConnectionGUID: fR44LZ/tSa6pnb00D2yCsA==
X-CSE-MsgGUID: tJTIs02wT46h4euJgYgNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192273563"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Nov 2025 23:03:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNQbz-000000000So-1cMO;
	Mon, 24 Nov 2025 07:03:47 +0000
Date: Mon, 24 Nov 2025 15:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-cleanup 1/12] fs/smb/client/cifsproto.h:221:57:
 error: unknown type name 'FILE_DIRECTORY_INFO'; did you mean
 'FILE_DIRECTORY_FILE_LE'?
Message-ID: <202511241516.6D5nvE8a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-cleanup
head:   04f6c96ee8167c25e3e8403da23a09e8b926e88b
commit: aa358cceaf202eadae85a42a3e34e941628a68fa [1/12] cifs: Do some preparation prior to organising the function declarations
config: arc-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251124/202511241516.6D5nvE8a-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241516.6D5nvE8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241516.6D5nvE8a-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         |                                                 bpf_callback_t
   fs/smb/client/cifsproto.h:97:25: error: unknown type name 'mid_handle_t'; did you mean 'irq_handler_t'?
      97 |                         mid_handle_t *handle, void *cbdata, const int flags,
         |                         ^~~~~~~~~~~~
         |                         irq_handler_t
   fs/smb/client/cifsproto.h:99:57: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
      99 | extern struct TCP_Server_Info *cifs_pick_channel(struct cifs_ses *ses);
         |                                                         ^~~~~~~~
   fs/smb/client/cifsproto.h:100:58: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     100 | extern int cifs_send_recv(const unsigned int xid, struct cifs_ses *ses,
         |                                                          ^~~~~~~~
   fs/smb/client/cifsproto.h:104:62: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     104 | extern int compound_send_recv(const unsigned int xid, struct cifs_ses *ses,
         |                                                              ^~~~~~~~
   fs/smb/client/cifsproto.h:109:62: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     109 | extern int SendReceive(const unsigned int /* xid */ , struct cifs_ses *,
         |                                                              ^~~~~~~~
   fs/smb/client/cifsproto.h:113:60: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     113 | extern int SendReceiveNoRsp(const unsigned int xid, struct cifs_ses *ses,
         |                                                            ^~~~~~~~
   fs/smb/client/cifsproto.h:115:33: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     115 | int cifs_sync_mid_result(struct mid_q_entry *mid, struct TCP_Server_Info *server);
         |                                 ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:116:54: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     116 | extern struct mid_q_entry *cifs_setup_request(struct cifs_ses *,
         |                                                      ^~~~~~~~
   fs/smb/client/cifsproto.h:129:41: warning: 'struct cifs_credits' declared inside parameter list will not be visible outside of this definition or declaration
     129 |                                  struct cifs_credits *credits);
         |                                         ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'send_cancel':
   fs/smb/client/cifsproto.h:135:22: error: invalid use of undefined type 'struct TCP_Server_Info'
     135 |         return server->ops->send_cancel ?
         |                      ^~
   fs/smb/client/cifsproto.h:136:39: error: invalid use of undefined type 'struct TCP_Server_Info'
     136 |                                 server->ops->send_cancel(server, rqst, mid) : 0;
         |                                       ^~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:140:63: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     140 | extern int SendReceive2(const unsigned int /* xid */ , struct cifs_ses *,
         |                                                               ^~~~~~~~
   fs/smb/client/cifsproto.h:145:32: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     145 |                         struct cifs_tcon *ptcon,
         |                                ^~~~~~~~~
   fs/smb/client/cifsproto.h:162:43: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     162 | extern bool is_size_safe_to_change(struct cifsInodeInfo *cifsInode, __u64 eof,
         |                                           ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:164:36: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     164 | extern void cifs_update_eof(struct cifsInodeInfo *cifsi, loff_t offset,
         |                                    ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:166:46: warning: 'struct cifs_io_subrequest' declared inside parameter list will not be visible outside of this definition or declaration
     166 | void cifs_write_subrequest_terminated(struct cifs_io_subrequest *wdata, ssize_t result);
         |                                              ^~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:167:55: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     167 | extern struct cifsFileInfo *find_writable_file(struct cifsInodeInfo *, int);
         |                                                       ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:168:42: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     168 | extern int cifs_get_writable_file(struct cifsInodeInfo *cifs_inode,
         |                                          ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:171:42: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     171 | extern int cifs_get_writable_path(struct cifs_tcon *tcon, const char *name,
         |                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:174:55: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     174 | extern struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *, bool);
         |                                                       ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:175:42: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     175 | extern int cifs_get_readable_path(struct cifs_tcon *tcon, const char *name,
         |                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:177:42: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     177 | extern int cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *inode,
         |                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:187:42: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     187 |                             const struct cifs_tcon *, int /* length of
         |                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:190:40: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     190 |                                 struct cifs_ses *ses,
         |                                        ^~~~~~~~
   fs/smb/client/cifsproto.h:194:58: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     194 | extern int CIFS_SessSetup(const unsigned int xid, struct cifs_ses *ses,
         |                                                          ^~~~~~~~
   fs/smb/client/cifsproto.h:201:42: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     201 | extern void cifs_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock);
         |                                          ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:202:35: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     202 | extern int cifs_get_writer(struct cifsInodeInfo *cinode);
         |                                   ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:203:36: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     203 | extern void cifs_put_writer(struct cifsInodeInfo *cinode);
         |                                    ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:204:43: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     204 | extern void cifs_done_oplock_break(struct cifsInodeInfo *cinode);
         |                                           ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:210:47: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     210 | struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fid *fid, struct file *file,
         |                                               ^~~~~~~~
   fs/smb/client/cifsproto.h:217:56: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     217 | void cifs_fill_uniqueid(struct super_block *sb, struct cifs_fattr *fattr);
         |                                                        ^~~~~~~~~~
   fs/smb/client/cifsproto.h:218:45: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     218 | extern void cifs_unix_basic_to_fattr(struct cifs_fattr *fattr,
         |                                             ^~~~~~~~~~
>> fs/smb/client/cifsproto.h:221:57: error: unknown type name 'FILE_DIRECTORY_INFO'; did you mean 'FILE_DIRECTORY_FILE_LE'?
     221 | extern void cifs_dir_info_to_fattr(struct cifs_fattr *, FILE_DIRECTORY_INFO *,
         |                                                         ^~~~~~~~~~~~~~~~~~~
         |                                                         FILE_DIRECTORY_FILE_LE
   fs/smb/client/cifsproto.h:223:60: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     223 | extern int cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr,
         |                                                            ^~~~~~~~~~
   fs/smb/client/cifsproto.h:226:39: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     226 |                                struct cifs_fattr *fattr);
         |                                       ^~~~~~~~~~
   fs/smb/client/cifsproto.h:230:38: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     230 |                         const struct cifs_fid *fid);
         |                                      ^~~~~~~~
   fs/smb/client/cifsproto.h:229:32: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     229 |                         struct cifs_open_info_data *data, struct super_block *sb, int xid,
         |                                ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:233:47: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     233 |                                        struct cifs_open_info_data *data,
         |                                               ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:245:40: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     245 |                                 struct cifs_fattr *fattr, uint sidtype);
         |                                        ^~~~~~~~~~
   fs/smb/client/cifsproto.h:244:59: warning: 'struct smb_sid' declared inside parameter list will not be visible outside of this definition or declaration
     244 | extern int sid_to_id(struct cifs_sb_info *cifs_sb, struct smb_sid *psid,
         |                                                           ^~~~~~~
   fs/smb/client/cifsproto.h:249:62: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     249 |                               const char *path, const struct cifs_fid *pfid);
         |                                                              ^~~~~~~~
   fs/smb/client/cifsproto.h:247:38: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     247 |                               struct cifs_fattr *fattr, struct inode *inode,
         |                                      ^~~~~~~~~~
   fs/smb/client/cifsproto.h:255:46: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     255 |                                 const struct cifs_fid *pfid, u32 *plen, u32 info);
         |                                              ^~~~~~~~
   fs/smb/client/cifsproto.h:262:48: warning: 'struct smb_ace' declared inside parameter list will not be visible outside of this definition or declaration
     262 | extern unsigned int setup_authusers_ACE(struct smb_ace *pace);
         |                                                ^~~~~~~
   fs/smb/client/cifsproto.h:263:51: warning: 'struct smb_ace' declared inside parameter list will not be visible outside of this definition or declaration
     263 | extern unsigned int setup_special_mode_ACE(struct smb_ace *pace,
         |                                                   ^~~~~~~
   fs/smb/client/cifsproto.h:266:57: warning: 'struct smb_ace' declared inside parameter list will not be visible outside of this definition or declaration
     266 | extern unsigned int setup_special_user_owner_ACE(struct smb_ace *pace);
         |                                                         ^~~~~~~
   fs/smb/client/cifsproto.h:277:34: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     277 | void cifs_mount_put_conns(struct cifs_mount_ctx *mnt_ctx);
         |                                  ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:278:35: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     278 | int cifs_mount_get_session(struct cifs_mount_ctx *mnt_ctx);
         |                                   ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:279:32: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     279 | int cifs_is_path_remote(struct cifs_mount_ctx *mnt_ctx);
         |                                ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:280:32: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     280 | int cifs_mount_get_tcon(struct cifs_mount_ctx *mnt_ctx);
         |                                ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:284:49: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     284 | extern void cifs_mark_open_files_invalid(struct cifs_tcon *tcon);
         |                                                 ^~~~~~~~~
   fs/smb/client/cifsproto.h:285:51: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     285 | extern void cifs_reopen_persistent_handles(struct cifs_tcon *tcon);
         |                                                   ^~~~~~~~~
   fs/smb/client/cifsproto.h:289:44: warning: 'struct cifsLockInfo' declared inside parameter list will not be visible outside of this definition or declaration
     289 |                                     struct cifsLockInfo **conf_lock,
         |                                            ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h:293:42: warning: 'struct cifs_pending_open' declared inside parameter list will not be visible outside of this definition or declaration
     293 |                                   struct cifs_pending_open *open);
         |                                          ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:291:42: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     291 | extern void cifs_add_pending_open(struct cifs_fid *fid,
         |                                          ^~~~~~~~
   fs/smb/client/cifsproto.h:296:49: warning: 'struct cifs_pending_open' declared inside parameter list will not be visible outside of this definition or declaration
     296 |                                          struct cifs_pending_open *open);
         |                                                 ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:294:49: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     294 | extern void cifs_add_pending_open_locked(struct cifs_fid *fid,
         |                                                 ^~~~~~~~
   fs/smb/client/cifsproto.h:297:42: warning: 'struct cifs_pending_open' declared inside parameter list will not be visible outside of this definition or declaration
     297 | extern void cifs_del_pending_open(struct cifs_pending_open *open);
         |                                          ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:300:40: warning: 'struct cifs_deferred_close' declared inside parameter list will not be visible outside of this definition or declaration
     300 |                                 struct cifs_deferred_close **dclose);
         |                                        ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:303:40: warning: 'struct cifs_deferred_close' declared inside parameter list will not be visible outside of this definition or declaration
     303 |                                 struct cifs_deferred_close *dclose);
         |                                        ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:307:45: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     307 | extern void cifs_close_deferred_file(struct cifsInodeInfo *cifs_inode);
         |                                             ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:309:50: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     309 | extern void cifs_close_all_deferred_files(struct cifs_tcon *cifs_tcon);
         |                                                  ^~~~~~~~~
   fs/smb/client/cifsproto.h:311:51: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     311 | void cifs_close_deferred_file_under_dentry(struct cifs_tcon *cifs_tcon,
         |                                                   ^~~~~~~~~
   fs/smb/client/cifsproto.h:322:34: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     322 | extern void cifs_put_tcon(struct cifs_tcon *tcon, enum smb3_tcon_ref_trace trace);
         |                                  ^~~~~~~~~
   fs/smb/client/cifsproto.h:331:42: warning: 'struct cifsLockInfo' declared inside parameter list will not be visible outside of this definition or declaration
     331 | extern void cifs_del_lock_waiters(struct cifsLockInfo *lock);
         |                                          ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h:333:54: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
--
         |                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:448:42: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     448 |                                   struct cifs_tcon *tcon, const char *file_name,
         |                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:454:46: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     454 |                         umode_t mode, struct cifs_tcon *tcon,
         |                                              ^~~~~~~~~
   fs/smb/client/cifsproto.h:456:56: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     456 | extern int CIFSSMBRmDir(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                        ^~~~~~~~~
   fs/smb/client/cifsproto.h:458:60: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     458 | extern int CIFSPOSIXDelFile(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                            ^~~~~~~~~
   fs/smb/client/cifsproto.h:462:58: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     462 | extern int CIFSSMBDelFile(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:465:50: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     465 | int CIFSSMBRename(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                  ^~~~~~~~~
   fs/smb/client/cifsproto.h:469:65: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     469 | extern int CIFSSMBRenameOpenFile(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                                 ^~~~~~~~~
   fs/smb/client/cifsproto.h:474:31: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     474 |                        struct cifs_tcon *tcon,
         |                               ^~~~~~~~~
   fs/smb/client/cifsproto.h:479:32: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     479 |                         struct cifs_tcon *tcon,
         |                                ^~~~~~~~~
   fs/smb/client/cifsproto.h:484:32: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     484 |                         struct cifs_tcon *tcon,
         |                                ^~~~~~~~~
   fs/smb/client/cifsproto.h:488:32: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     488 |                         struct cifs_tcon *tcon,
         |                                ^~~~~~~~~
   fs/smb/client/cifsproto.h:492:44: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     492 |                                     struct cifs_tcon *tcon,
         |                                            ^~~~~~~~~
   fs/smb/client/cifsproto.h:500:55: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     500 |                                                struct cifs_tcon *tcon,
         |                                                       ^~~~~~~~~
   fs/smb/client/cifsproto.h:497:55: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     497 | extern struct inode *cifs_create_reparse_inode(struct cifs_open_info_data *data,
         |                                                       ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:506:43: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     506 |                                    struct cifs_tcon *tcon, __u16 fid);
         |                                           ^~~~~~~~~
   fs/smb/client/cifsproto.h:507:53: warning: 'struct cifs_open_parms' declared inside parameter list will not be visible outside of this definition or declaration
     507 | extern int CIFS_open(const unsigned int xid, struct cifs_open_parms *oparms,
         |                                                     ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:509:57: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     509 | extern int SMBLegacyOpen(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                         ^~~~~~~~~
   fs/smb/client/cifsproto.h:514:59: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     514 | extern int CIFSPOSIXCreate(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                           ^~~~~~~~~
   fs/smb/client/cifsproto.h:519:56: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     519 | extern int CIFSSMBClose(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                        ^~~~~~~~~
   fs/smb/client/cifsproto.h:522:56: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     522 | extern int CIFSSMBFlush(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                        ^~~~~~~~~
   fs/smb/client/cifsproto.h:525:55: warning: 'struct cifs_io_parms' declared inside parameter list will not be visible outside of this definition or declaration
     525 | extern int CIFSSMBRead(const unsigned int xid, struct cifs_io_parms *io_parms,
         |                                                       ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:528:56: warning: 'struct cifs_io_parms' declared inside parameter list will not be visible outside of this definition or declaration
     528 | extern int CIFSSMBWrite(const unsigned int xid, struct cifs_io_parms *io_parms,
         |                                                        ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:530:57: warning: 'struct cifs_io_parms' declared inside parameter list will not be visible outside of this definition or declaration
     530 | extern int CIFSSMBWrite2(const unsigned int xid, struct cifs_io_parms *io_parms,
         |                                                         ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:532:65: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     532 | extern int CIFSGetSrvInodeNumber(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                                 ^~~~~~~~~
   fs/smb/client/cifsproto.h:537:54: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     537 | extern int cifs_lockv(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                      ^~~~~~~~~
   fs/smb/client/cifsproto.h:541:55: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     541 | extern int CIFSSMBLock(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                       ^~~~~~~~~
   fs/smb/client/cifsproto.h:546:60: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     546 | extern int CIFSSMBPosixLock(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                            ^~~~~~~~~
   fs/smb/client/cifsproto.h:551:55: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     551 | extern int CIFSSMBTDis(const unsigned int xid, struct cifs_tcon *tcon);
         |                                                       ^~~~~~~~~
   fs/smb/client/cifsproto.h:553:57: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     553 | extern int CIFSSMBLogoff(const unsigned int xid, struct cifs_ses *ses);
         |                                                         ^~~~~~~~
   fs/smb/client/cifsproto.h:603:45: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     603 | extern bool couldbe_mf_symlink(const struct cifs_fattr *fattr);
         |                                             ^~~~~~~~~~
   fs/smb/client/cifsproto.h:606:38: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     606 |                               struct cifs_fattr *fattr,
         |                                      ^~~~~~~~~~
   fs/smb/client/cifsproto.h:621:29: warning: 'struct cifs_io_subrequest' declared inside parameter list will not be visible outside of this definition or declaration
     621 | int cifs_async_readv(struct cifs_io_subrequest *rdata);
         |                             ^~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:624:31: warning: 'struct cifs_io_subrequest' declared inside parameter list will not be visible outside of this definition or declaration
     624 | void cifs_async_writev(struct cifs_io_subrequest *wdata);
         |                               ^~~~~~~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:634:51: warning: 'struct cifs_calc_sig_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     634 |                           char *signature, struct cifs_calc_sig_ctx *ctx);
         |                                                   ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:638:46: warning: 'struct shash_desc' declared inside parameter list will not be visible outside of this definition or declaration
     638 | int cifs_alloc_hash(const char *name, struct shash_desc **sdesc);
         |                                              ^~~~~~~~~~
   fs/smb/client/cifsproto.h:639:28: warning: 'struct shash_desc' declared inside parameter list will not be visible outside of this definition or declaration
     639 | void cifs_free_hash(struct shash_desc **sdesc);
         |                            ^~~~~~~~~~
   fs/smb/client/cifsproto.h:642:54: warning: 'struct cifs_server_iface' declared inside parameter list will not be visible outside of this definition or declaration
     642 | bool is_ses_using_iface(struct cifs_ses *ses, struct cifs_server_iface *iface);
         |                                                      ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:677:39: warning: 'struct cifs_search_info' declared inside parameter list will not be visible outside of this definition or declaration
     677 |                                struct cifs_search_info *srch_inf);
         |                                       ^~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:687:32: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     687 |                         struct cifs_open_info_data *data);
         |                                ^~~~~~~~~~~~~~~~~~~
   In file included from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from fs/smb/client/cifs_unicode.c:7:
   fs/smb/client/cifsproto.h: In function 'cifs_smb_ses_inc_refcount':
   fs/smb/client/cifsproto.h:752:30: error: 'cifs_tcp_ses_lock' undeclared (first use in this function); did you mean 'cifs_posix_lock'?
     752 |         lockdep_assert_held(&cifs_tcp_ses_lock);
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
   fs/smb/client/cifsproto.h:752:9: note: in expansion of macro 'lockdep_assert_held'
     752 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |         ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:752:30: note: each undeclared identifier is reported only once for each function it appears in
     752 |         lockdep_assert_held(&cifs_tcp_ses_lock);
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
   fs/smb/client/cifsproto.h:752:9: note: in expansion of macro 'lockdep_assert_held'
     752 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |         ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:753:12: error: invalid use of undefined type 'struct cifs_ses'
     753 |         ses->ses_count++;
         |            ^~
   fs/smb/client/cifsproto.h: In function 'release_mid':
   fs/smb/client/cifsproto.h:772:22: error: invalid use of undefined type 'struct mid_q_entry'
     772 |         kref_put(&mid->refcount, __release_mid);
         |                      ^~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:775:47: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     775 | static inline void cifs_free_open_info(struct cifs_open_info_data *data)
         |                                               ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'cifs_free_open_info':
   fs/smb/client/cifsproto.h:777:19: error: invalid use of undefined type 'struct cifs_open_info_data'
     777 |         kfree(data->symlink_target);
         |                   ^~
   fs/smb/client/cifsproto.h:778:26: error: invalid use of undefined type 'struct cifs_open_info_data'
     778 |         free_rsp_buf(data->reparse.io.buftype, data->reparse.io.iov.iov_base);
         |                          ^~
   fs/smb/client/cifsproto.h:778:52: error: invalid use of undefined type 'struct cifs_open_info_data'
     778 |         free_rsp_buf(data->reparse.io.buftype, data->reparse.io.iov.iov_base);
         |                                                    ^~
   fs/smb/client/cifsproto.h:779:31: error: invalid application of 'sizeof' to incomplete type 'struct cifs_open_info_data'
     779 |         memset(data, 0, sizeof(*data));
         |                               ^


vim +221 fs/smb/client/cifsproto.h

1bd5bbcb653177 fs/cifs/cifsproto.h       Steve French       2006-09-28  208  
d46b0da7a33dd8 fs/cifs/cifsproto.h       Dave Wysochanski   2019-10-23  209  extern void cifs_down_write(struct rw_semaphore *sem);
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara    2022-10-03 @210  struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fid *fid, struct file *file,
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara    2022-10-03  211  				       struct tcon_link *tlink, __u32 oplock,
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara    2022-10-03  212  				       const char *symlink_target);
f6f1f1790775fb fs/cifs/cifsproto.h       Al Viro            2021-03-18  213  extern int cifs_posix_open(const char *full_path, struct inode **inode,
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky    2012-06-20  214  			   struct super_block *sb, int mode,
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky    2012-06-20  215  			   unsigned int f_flags, __u32 *oplock, __u16 *netfid,
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky    2012-06-20  216  			   unsigned int xid);
4065c802da7484 fs/cifs/cifsproto.h       Jeff Layton        2010-05-17  217  void cifs_fill_uniqueid(struct super_block *sb, struct cifs_fattr *fattr);
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  218  extern void cifs_unix_basic_to_fattr(struct cifs_fattr *fattr,
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  219  				     FILE_UNIX_BASIC_INFO *info,
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  220  				     struct cifs_sb_info *cifs_sb);
c052e2b423f3ea fs/cifs/cifsproto.h       Shirish Pargaonkar 2012-09-28 @221  extern void cifs_dir_info_to_fattr(struct cifs_fattr *, FILE_DIRECTORY_INFO *,
c052e2b423f3ea fs/cifs/cifsproto.h       Shirish Pargaonkar 2012-09-28  222  					struct cifs_sb_info *);
e4b61f3b1c67f5 fs/smb/client/cifsproto.h Bharath SM         2024-02-29  223  extern int cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr,
e4b61f3b1c67f5 fs/smb/client/cifsproto.h Bharath SM         2024-02-29  224  			       bool from_readdir);
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  225  extern struct inode *cifs_iget(struct super_block *sb,
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  226  			       struct cifs_fattr *fattr);
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton        2009-06-25  227  

:::::: The code at line 221 was first introduced by commit
:::::: c052e2b423f3eabe9f3f32e60744afa5cf26f6b9 cifs: obtain file access during backup intent lookup (resend)

:::::: TO: Shirish Pargaonkar <shirishpargaonkar@gmail.com>
:::::: CC: Steve French <smfrench@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
