Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC47B24729D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 16:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175667; cv=none; b=iyGPW2TaJEaw1/n2iVjes/BgOqwzOsHbtALSDjo7s+FrWTv1DAe8wD5O9iLF4O0KYfBzazwyVsE/sYKp3Oc5qhqGfkf/WtW0zbj3aCrxadPjXDqdVhj4IXB/s0jNUYPHHVXFUsztKR1varLOljsUT7hFMpODzGrFCZa070KCQjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175667; c=relaxed/simple;
	bh=T8c17aTNE8rblOHt70hJeRv2cncaVk2/5tHuWpPBbjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvaEWH1TF+zuTTsM5hsbHjOEYXrh13+R1/vNnOTss8Z/RQ+SL6Y8oz4oh//OsC6Z1KrLkMkWATTi7w/xFelgRUozDIm37+E6NbXPhZKtvxVQgjNlq5QtrmI0TxY2hnJWNwYsqG0G7LSBZW44fsxM6g1LaLe5Bvv3fJeNyTcwpIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPWfFNtx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPWfFNtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757175663; x=1788711663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=T8c17aTNE8rblOHt70hJeRv2cncaVk2/5tHuWpPBbjU=;
  b=PPWfFNtxC2rUcmNTAlca6A3+viubtdpdQ02RgLFtkSjLkdYLKHSawoLm
   YY75T+YzOAslq2ZJtvMDLExN55ypL1r/U7O1SPXjdwFrii83GYvnEWfMh
   3A/o82sgpOKQS5TH+1cl7my7JBxF92fLpz2wZc8pgpBT/wTMbKF29OfJF
   nlYjkVKlJD3oUJxBBuwYHsA4T/87FCjAR3XPnpNHgMnzpR+CaRCT0qR5G
   JUcJC4bq0cwWzlYzzVnYAng8tVVYcovsATETNaz4X5XspAI3O/i6ozmEJ
   4sSVOqLXkFM54PW90qIQUbSHmy+apcFm628W2F1nxQSCIrgsGoUfai2nU
   Q==;
X-CSE-ConnectionGUID: G2PL71RdRm6qh8NL7wgp4A==
X-CSE-MsgGUID: zxGUnLPhRQK+fHglxHw+4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59421849"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59421849"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 09:21:02 -0700
X-CSE-ConnectionGUID: ao0ZAX3RR6ODH6NgfGgTNg==
X-CSE-MsgGUID: 4Ytr9X2OTkmL9V+WkZkjmA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Sep 2025 09:21:00 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuves-0001cH-0V;
	Sat, 06 Sep 2025 16:20:58 +0000
Date: Sun, 7 Sep 2025 00:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] cifs: Do some preparation prior to organising
 the function declarations
Message-ID: <202509062306.3r4NrZD0-lkp@intel.com>
References: <20250904211839.1152340-2-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250904211839.1152340-2-dhowells@redhat.com>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cifs/for-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/cifs-Do-some-preparation-prior-to-organising-the-function-declarations/20250905-052128
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20250904211839.1152340-2-dhowells%40redhat.com
patch subject: [RFC PATCH 1/2] cifs: Do some preparation prior to organising the function declarations
config: sh-randconfig-001-20250906 (https://download.01.org/0day-ci/archive/20250906/202509062306.3r4NrZD0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509062306.3r4NrZD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509062306.3r4NrZD0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/smb/client/cifs_unicode.c:12:
>> fs/smb/client/cifsproto.h:29:28: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      29 | extern int smb_send(struct TCP_Server_Info *, struct smb_hdr *,
         |                            ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:31:33: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      31 | extern int smb_send_kvec(struct TCP_Server_Info *server,
         |                                 ^~~~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:79:45: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
      79 |                                      struct cifs_tcon *tcon,
         |                                             ^~~~~~~~~
>> fs/smb/client/cifsproto.h:83:31: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
      83 | extern void delete_mid(struct mid_q_entry *mid);
         |                               ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:85:38: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
      85 | extern void cifs_wake_up_task(struct mid_q_entry *mid);
         |                                      ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:87:40: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
      87 |                                 struct mid_q_entry *mid);
         |                                        ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:86:40: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      86 | extern int cifs_handle_standard(struct TCP_Server_Info *server,
         |                                        ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:94:47: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      94 | extern int cifs_discard_remaining_data(struct TCP_Server_Info *server);
         |                                               ^~~~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:97:25: error: unknown type name 'mid_receive_t'
      97 |                         mid_receive_t *receive, mid_callback_t *callback,
         |                         ^~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:97:49: error: unknown type name 'mid_callback_t'; did you mean 'bpf_callback_t'?
      97 |                         mid_receive_t *receive, mid_callback_t *callback,
         |                                                 ^~~~~~~~~~~~~~
         |                                                 bpf_callback_t
>> fs/smb/client/cifsproto.h:98:25: error: unknown type name 'mid_handle_t'; did you mean 'irq_handler_t'?
      98 |                         mid_handle_t *handle, void *cbdata, const int flags,
         |                         ^~~~~~~~~~~~
         |                         irq_handler_t
>> fs/smb/client/cifsproto.h:100:57: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     100 | extern struct TCP_Server_Info *cifs_pick_channel(struct cifs_ses *ses);
         |                                                         ^~~~~~~~
   fs/smb/client/cifsproto.h:101:58: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     101 | extern int cifs_send_recv(const unsigned int xid, struct cifs_ses *ses,
         |                                                          ^~~~~~~~
   fs/smb/client/cifsproto.h:105:62: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     105 | extern int compound_send_recv(const unsigned int xid, struct cifs_ses *ses,
         |                                                              ^~~~~~~~
   fs/smb/client/cifsproto.h:110:62: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     110 | extern int SendReceive(const unsigned int /* xid */ , struct cifs_ses *,
         |                                                              ^~~~~~~~
   fs/smb/client/cifsproto.h:114:60: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     114 | extern int SendReceiveNoRsp(const unsigned int xid, struct cifs_ses *ses,
         |                                                            ^~~~~~~~
   fs/smb/client/cifsproto.h:116:33: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     116 | int cifs_sync_mid_result(struct mid_q_entry *mid, struct TCP_Server_Info *server);
         |                                 ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:117:54: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     117 | extern struct mid_q_entry *cifs_setup_request(struct cifs_ses *,
         |                                                      ^~~~~~~~
>> fs/smb/client/cifsproto.h:130:41: warning: 'struct cifs_credits' declared inside parameter list will not be visible outside of this definition or declaration
     130 |                                  struct cifs_credits *credits);
         |                                         ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'send_cancel':
>> fs/smb/client/cifsproto.h:136:22: error: invalid use of undefined type 'struct TCP_Server_Info'
     136 |         return server->ops->send_cancel ?
         |                      ^~
   fs/smb/client/cifsproto.h:137:39: error: invalid use of undefined type 'struct TCP_Server_Info'
     137 |                                 server->ops->send_cancel(server, rqst, mid) : 0;
         |                                       ^~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:141:63: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     141 | extern int SendReceive2(const unsigned int /* xid */ , struct cifs_ses *,
         |                                                               ^~~~~~~~
   fs/smb/client/cifsproto.h:146:32: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     146 |                         struct cifs_tcon *ptcon,
         |                                ^~~~~~~~~
>> fs/smb/client/cifsproto.h:163:43: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     163 | extern bool is_size_safe_to_change(struct cifsInodeInfo *cifsInode, __u64 eof,
         |                                           ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:165:36: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     165 | extern void cifs_update_eof(struct cifsInodeInfo *cifsi, loff_t offset,
         |                                    ^~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:167:46: warning: 'struct cifs_io_subrequest' declared inside parameter list will not be visible outside of this definition or declaration
     167 | void cifs_write_subrequest_terminated(struct cifs_io_subrequest *wdata, ssize_t result);
         |                                              ^~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:168:55: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     168 | extern struct cifsFileInfo *find_writable_file(struct cifsInodeInfo *, int);
         |                                                       ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:169:42: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     169 | extern int cifs_get_writable_file(struct cifsInodeInfo *cifs_inode,
         |                                          ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:172:42: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     172 | extern int cifs_get_writable_path(struct cifs_tcon *tcon, const char *name,
         |                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:175:55: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     175 | extern struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *, bool);
         |                                                       ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:176:42: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     176 | extern int cifs_get_readable_path(struct cifs_tcon *tcon, const char *name,
         |                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:178:42: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     178 | extern int cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *inode,
         |                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:188:42: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     188 |                             const struct cifs_tcon *, int /* length of
         |                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:191:40: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     191 |                                 struct cifs_ses *ses,
         |                                        ^~~~~~~~
   fs/smb/client/cifsproto.h:195:58: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     195 | extern int CIFS_SessSetup(const unsigned int xid, struct cifs_ses *ses,
         |                                                          ^~~~~~~~
   fs/smb/client/cifsproto.h:202:42: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     202 | extern void cifs_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock);
         |                                          ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:203:35: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     203 | extern int cifs_get_writer(struct cifsInodeInfo *cinode);
         |                                   ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:204:36: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     204 | extern void cifs_put_writer(struct cifsInodeInfo *cinode);
         |                                    ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:205:43: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     205 | extern void cifs_done_oplock_break(struct cifsInodeInfo *cinode);
         |                                           ^~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:211:47: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     211 | struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fid *fid, struct file *file,
         |                                               ^~~~~~~~
>> fs/smb/client/cifsproto.h:218:56: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     218 | void cifs_fill_uniqueid(struct super_block *sb, struct cifs_fattr *fattr);
         |                                                        ^~~~~~~~~~
   fs/smb/client/cifsproto.h:219:45: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     219 | extern void cifs_unix_basic_to_fattr(struct cifs_fattr *fattr,
         |                                             ^~~~~~~~~~
   fs/smb/client/cifsproto.h:222:43: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     222 | extern void cifs_dir_info_to_fattr(struct cifs_fattr *, FILE_DIRECTORY_INFO *,
         |                                           ^~~~~~~~~~
   fs/smb/client/cifsproto.h:224:60: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     224 | extern int cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr,
         |                                                            ^~~~~~~~~~
   fs/smb/client/cifsproto.h:227:39: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     227 |                                struct cifs_fattr *fattr);
         |                                       ^~~~~~~~~~
   fs/smb/client/cifsproto.h:231:38: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     231 |                         const struct cifs_fid *fid);
         |                                      ^~~~~~~~
>> fs/smb/client/cifsproto.h:230:32: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     230 |                         struct cifs_open_info_data *data, struct super_block *sb, int xid,
         |                                ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:234:47: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     234 |                                        struct cifs_open_info_data *data,
         |                                               ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:246:40: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     246 |                                 struct cifs_fattr *fattr, uint sidtype);
         |                                        ^~~~~~~~~~
>> fs/smb/client/cifsproto.h:245:59: warning: 'struct smb_sid' declared inside parameter list will not be visible outside of this definition or declaration
     245 | extern int sid_to_id(struct cifs_sb_info *cifs_sb, struct smb_sid *psid,
         |                                                           ^~~~~~~
   fs/smb/client/cifsproto.h:250:62: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     250 |                               const char *path, const struct cifs_fid *pfid);
         |                                                              ^~~~~~~~
   fs/smb/client/cifsproto.h:248:38: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     248 |                               struct cifs_fattr *fattr, struct inode *inode,
         |                                      ^~~~~~~~~~
   fs/smb/client/cifsproto.h:256:46: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     256 |                                 const struct cifs_fid *pfid, u32 *plen, u32 info);
         |                                              ^~~~~~~~
>> fs/smb/client/cifsproto.h:263:48: warning: 'struct smb_ace' declared inside parameter list will not be visible outside of this definition or declaration
     263 | extern unsigned int setup_authusers_ACE(struct smb_ace *pace);
         |                                                ^~~~~~~
   fs/smb/client/cifsproto.h:264:51: warning: 'struct smb_ace' declared inside parameter list will not be visible outside of this definition or declaration
     264 | extern unsigned int setup_special_mode_ACE(struct smb_ace *pace,
         |                                                   ^~~~~~~
   fs/smb/client/cifsproto.h:267:57: warning: 'struct smb_ace' declared inside parameter list will not be visible outside of this definition or declaration
     267 | extern unsigned int setup_special_user_owner_ACE(struct smb_ace *pace);
         |                                                         ^~~~~~~
>> fs/smb/client/cifsproto.h:278:34: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     278 | void cifs_mount_put_conns(struct cifs_mount_ctx *mnt_ctx);
         |                                  ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:279:35: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     279 | int cifs_mount_get_session(struct cifs_mount_ctx *mnt_ctx);
         |                                   ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:280:32: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     280 | int cifs_is_path_remote(struct cifs_mount_ctx *mnt_ctx);
         |                                ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:281:32: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     281 | int cifs_mount_get_tcon(struct cifs_mount_ctx *mnt_ctx);
         |                                ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:285:49: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     285 | extern void cifs_mark_open_files_invalid(struct cifs_tcon *tcon);
         |                                                 ^~~~~~~~~
   fs/smb/client/cifsproto.h:286:51: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     286 | extern void cifs_reopen_persistent_handles(struct cifs_tcon *tcon);
         |                                                   ^~~~~~~~~
>> fs/smb/client/cifsproto.h:290:44: warning: 'struct cifsLockInfo' declared inside parameter list will not be visible outside of this definition or declaration
     290 |                                     struct cifsLockInfo **conf_lock,
         |                                            ^~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:294:42: warning: 'struct cifs_pending_open' declared inside parameter list will not be visible outside of this definition or declaration
     294 |                                   struct cifs_pending_open *open);
         |                                          ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:292:42: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     292 | extern void cifs_add_pending_open(struct cifs_fid *fid,
         |                                          ^~~~~~~~
   fs/smb/client/cifsproto.h:297:49: warning: 'struct cifs_pending_open' declared inside parameter list will not be visible outside of this definition or declaration
     297 |                                          struct cifs_pending_open *open);
         |                                                 ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:295:49: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     295 | extern void cifs_add_pending_open_locked(struct cifs_fid *fid,
         |                                                 ^~~~~~~~
   fs/smb/client/cifsproto.h:298:42: warning: 'struct cifs_pending_open' declared inside parameter list will not be visible outside of this definition or declaration
     298 | extern void cifs_del_pending_open(struct cifs_pending_open *open);
         |                                          ^~~~~~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:301:40: warning: 'struct cifs_deferred_close' declared inside parameter list will not be visible outside of this definition or declaration
     301 |                                 struct cifs_deferred_close **dclose);
         |                                        ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:304:40: warning: 'struct cifs_deferred_close' declared inside parameter list will not be visible outside of this definition or declaration
     304 |                                 struct cifs_deferred_close *dclose);
         |                                        ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:308:45: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     308 | extern void cifs_close_deferred_file(struct cifsInodeInfo *cifs_inode);
         |                                             ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:310:50: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     310 | extern void cifs_close_all_deferred_files(struct cifs_tcon *cifs_tcon);
         |                                                  ^~~~~~~~~
   fs/smb/client/cifsproto.h:312:58: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     312 | extern void cifs_close_deferred_file_under_dentry(struct cifs_tcon *cifs_tcon,
         |                                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:323:34: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     323 | extern void cifs_put_tcon(struct cifs_tcon *tcon, enum smb3_tcon_ref_trace trace);
         |                                  ^~~~~~~~~
   fs/smb/client/cifsproto.h:332:42: warning: 'struct cifsLockInfo' declared inside parameter list will not be visible outside of this definition or declaration
     332 | extern void cifs_del_lock_waiters(struct cifsLockInfo *lock);
         |                                          ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h:334:54: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     334 | int cifs_tree_connect(const unsigned int xid, struct cifs_tcon *tcon);
         |                                                      ^~~~~~~~~
   fs/smb/client/cifsproto.h:337:43: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     337 |                                    struct cifs_ses *ses,
         |                                           ^~~~~~~~
   fs/smb/client/cifsproto.h:339:62: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     339 | extern int cifs_setup_session(const unsigned int xid, struct cifs_ses *ses,
         |                                                              ^~~~~~~~
   fs/smb/client/cifsproto.h:344:36: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     344 |                             struct cifs_ses *ses,
         |                                    ^~~~~~~~
   fs/smb/client/cifsproto.h:348:46: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     348 |                     const char *tree, struct cifs_tcon *tcon,
         |                                              ^~~~~~~~~
   fs/smb/client/cifsproto.h:347:52: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     347 | extern int CIFSTCon(const unsigned int xid, struct cifs_ses *ses,
         |                                                    ^~~~~~~~
   fs/smb/client/cifsproto.h:354:24: warning: 'struct cifs_search_info' declared inside parameter list will not be visible outside of this definition or declaration
     354 |                 struct cifs_search_info *psrch_inf,
         |                        ^~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:351:57: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     351 | extern int CIFSFindFirst(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                         ^~~~~~~~~
   fs/smb/client/cifsproto.h:359:24: warning: 'struct cifs_search_info' declared inside parameter list will not be visible outside of this definition or declaration
     359 |                 struct cifs_search_info *psrch_inf);
         |                        ^~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:357:56: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     357 | extern int CIFSFindNext(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                        ^~~~~~~~~
   fs/smb/client/cifsproto.h:361:57: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     361 | extern int CIFSFindClose(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                         ^~~~~~~~~
   fs/smb/client/cifsproto.h:364:60: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     364 | extern int CIFSSMBQFileInfo(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                            ^~~~~~~~~
   fs/smb/client/cifsproto.h:366:60: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     366 | extern int CIFSSMBQPathInfo(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                            ^~~~~~~~~
   fs/smb/client/cifsproto.h:370:63: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     370 | extern int SMBQueryInformation(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                               ^~~~~~~~~
   fs/smb/client/cifsproto.h:374:64: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     374 | extern int CIFSSMBUnixQFileInfo(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                                ^~~~~~~~~
   fs/smb/client/cifsproto.h:377:32: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     377 |                         struct cifs_tcon *tcon,
         |                                ^~~~~~~~~
   fs/smb/client/cifsproto.h:384:35: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     384 |                            struct dfs_info3_param **target_nodes,
         |                                   ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:382:59: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     382 | extern int CIFSGetDFSRefer(const unsigned int xid, struct cifs_ses *ses,
         |                                                           ^~~~~~~~
   fs/smb/client/cifsproto.h:390:39: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     390 |                                struct dfs_info3_param **target_nodes,
         |                                       ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:393:59: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     393 | extern void reset_cifs_unix_caps(unsigned int xid, struct cifs_tcon *tcon,
         |                                                           ^~~~~~~~~
   fs/smb/client/cifsproto.h:396:58: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     396 | extern int CIFSSMBQFSInfo(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                          ^~~~~~~~~
   fs/smb/client/cifsproto.h:398:57: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     398 | extern int SMBOldQFSInfo(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                         ^~~~~~~~~
   fs/smb/client/cifsproto.h:400:64: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     400 | extern int CIFSSMBSetFSUnixInfo(const unsigned int xid, struct cifs_tcon *tcon,
         |                                                                ^~~~~~~~~
   fs/smb/client/cifsproto.h:404:32: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     404 |                         struct cifs_tcon *tcon);
         |                                ^~~~~~~~~
   fs/smb/client/cifsproto.h:405:64: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     405 | extern int CIFSSMBQFSDeviceInfo(const unsigned int xid, struct cifs_tcon *tcon);
         |                                                                ^~~~~~~~~
   fs/smb/client/cifsproto.h:406:62: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     406 | extern int CIFSSMBQFSUnixInfo(const unsigned int xid, struct cifs_tcon *tcon);
         |                                                              ^~~~~~~~~
   fs/smb/client/cifsproto.h:407:63: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     407 | extern int CIFSSMBQFSPosixInfo(const unsigned int xid, struct cifs_tcon *tcon,


vim +/mid_receive_t +97 fs/smb/client/cifsproto.h

^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16   23  
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16   24  extern struct smb_hdr *cifs_buf_get(void);
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16   25  extern void cifs_buf_release(void *);
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16   26  extern struct smb_hdr *cifs_small_buf_get(void);
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16   27  extern void cifs_small_buf_release(void *);
6d81ed1ec22dbe fs/cifs/cifsproto.h       Sachin Prabhu              2014-06-16   28  extern void free_rsp_buf(int, void *);
0496e02d8791e7 fs/cifs/cifsproto.h       Jeff Layton                2008-12-30  @29  extern int smb_send(struct TCP_Server_Info *, struct smb_hdr *,
0496e02d8791e7 fs/cifs/cifsproto.h       Jeff Layton                2008-12-30   30  			unsigned int /* length */);
781802aa5a5950 fs/smb/client/cifsproto.h Pali Rohár                 2024-10-30   31  extern int smb_send_kvec(struct TCP_Server_Info *server,
781802aa5a5950 fs/smb/client/cifsproto.h Pali Rohár                 2024-10-30   32  			 struct msghdr *msg,
781802aa5a5950 fs/smb/client/cifsproto.h Pali Rohár                 2024-10-30   33  			 size_t *sent);
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky            2012-06-20   34  extern unsigned int _get_xid(void);
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky            2012-06-20   35  extern void _free_xid(unsigned int);
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky            2012-06-20   36  #define get_xid()							\
b6b38f704a8193 fs/cifs/cifsproto.h       Joe Perches                2010-04-21   37  ({									\
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky            2012-06-20   38  	unsigned int __xid = _get_xid();				\
a0a3036b81f1f6 fs/cifs/cifsproto.h       Joe Perches                2020-04-14   39  	cifs_dbg(FYI, "VFS: in %s as Xid: %u with uid: %d\n",		\
dbfb98af18194c fs/cifs/cifsproto.h       Eric W. Biederman          2013-02-06   40  		 __func__, __xid,					\
dbfb98af18194c fs/cifs/cifsproto.h       Eric W. Biederman          2013-02-06   41  		 from_kuid(&init_user_ns, current_fsuid()));		\
d683bcd3e5d157 fs/cifs/cifsproto.h       Steve French               2018-05-19   42  	trace_smb3_enter(__xid, __func__);				\
b6b38f704a8193 fs/cifs/cifsproto.h       Joe Perches                2010-04-21   43  	__xid;								\
b6b38f704a8193 fs/cifs/cifsproto.h       Joe Perches                2010-04-21   44  })
b6b38f704a8193 fs/cifs/cifsproto.h       Joe Perches                2010-04-21   45  
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky            2012-06-20   46  #define free_xid(curr_xid)						\
b6b38f704a8193 fs/cifs/cifsproto.h       Joe Perches                2010-04-21   47  do {									\
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky            2012-06-20   48  	_free_xid(curr_xid);						\
a0a3036b81f1f6 fs/cifs/cifsproto.h       Joe Perches                2020-04-14   49  	cifs_dbg(FYI, "VFS: leaving %s (xid = %u) rc = %d\n",		\
b6b38f704a8193 fs/cifs/cifsproto.h       Joe Perches                2010-04-21   50  		 __func__, curr_xid, (int)rc);				\
d683bcd3e5d157 fs/cifs/cifsproto.h       Steve French               2018-05-19   51  	if (rc)								\
d683bcd3e5d157 fs/cifs/cifsproto.h       Steve French               2018-05-19   52  		trace_smb3_exit_err(curr_xid, __func__, (int)rc);	\
d683bcd3e5d157 fs/cifs/cifsproto.h       Steve French               2018-05-19   53  	else								\
d683bcd3e5d157 fs/cifs/cifsproto.h       Steve French               2018-05-19   54  		trace_smb3_exit_done(curr_xid, __func__);		\
b6b38f704a8193 fs/cifs/cifsproto.h       Joe Perches                2010-04-21   55  } while (0)
4d79dba0e00749 fs/cifs/cifsproto.h       Shirish Pargaonkar         2011-04-27   56  extern int init_cifs_idmap(void);
4d79dba0e00749 fs/cifs/cifsproto.h       Shirish Pargaonkar         2011-04-27   57  extern void exit_cifs_idmap(void);
b74cb9a80268be fs/cifs/cifsproto.h       Sachin Prabhu              2016-05-17   58  extern int init_cifs_spnego(void);
b74cb9a80268be fs/cifs/cifsproto.h       Sachin Prabhu              2016-05-17   59  extern void exit_cifs_spnego(void);
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   60  extern const char *build_path_from_dentry(struct dentry *, void *);
7ad54b98fc1f14 fs/cifs/cifsproto.h       Paulo Alcantara            2022-12-18   61  char *__build_path_from_dentry_optional_prefix(struct dentry *direntry, void *page,
7ad54b98fc1f14 fs/cifs/cifsproto.h       Paulo Alcantara            2022-12-18   62  					       const char *tree, int tree_len,
7ad54b98fc1f14 fs/cifs/cifsproto.h       Paulo Alcantara            2022-12-18   63  					       bool prefix);
268a635d414df4 fs/cifs/cifsproto.h       Aurelien Aptel             2017-02-13   64  extern char *build_path_from_dentry_optional_prefix(struct dentry *direntry,
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   65  						    void *page, bool prefix);
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   66  static inline void *alloc_dentry_path(void)
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   67  {
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   68  	return __getname();
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   69  }
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   70  
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   71  static inline void free_dentry_path(void *page)
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   72  {
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   73  	if (page)
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   74  		__putname(page);
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   75  }
f6a9bc336b600e fs/cifs/cifsproto.h       Al Viro                    2021-03-05   76  
3fa1c6d1b8f5c3 fs/cifs/cifsproto.h       Ronnie Sahlberg            2020-12-09   77  extern char *cifs_build_path_to_root(struct smb3_fs_context *ctx,
6d3ea7e4975aed fs/cifs/cifsproto.h       Steve French               2012-11-28   78  				     struct cifs_sb_info *cifs_sb,
374402a2a1dfbb fs/cifs/cifsproto.h       Sachin Prabhu              2016-12-15  @79  				     struct cifs_tcon *tcon,
374402a2a1dfbb fs/cifs/cifsproto.h       Sachin Prabhu              2016-12-15   80  				     int add_treename);
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16   81  extern char *build_wildcard_path_from_dentry(struct dentry *direntry);
abdb1742a31238 fs/cifs/cifsproto.h       Paulo Alcantara            2022-10-04   82  char *cifs_build_devname(char *nodename, const char *prepath);
70f08f914a37a0 fs/cifs/cifsproto.h       Enzo Matsumiya             2022-08-05  @83  extern void delete_mid(struct mid_q_entry *mid);
e6322fd177c688 fs/smb/client/cifsproto.h Paulo Alcantara            2023-10-25   84  void __release_mid(struct kref *refcount);
2dc7e1c0331694 fs/cifs/cifsproto.h       Pavel Shilovsky            2011-12-26   85  extern void cifs_wake_up_task(struct mid_q_entry *mid);
4326ed2f6a16ae fs/cifs/cifsproto.h       Pavel Shilovsky            2016-11-17   86  extern int cifs_handle_standard(struct TCP_Server_Info *server,
4326ed2f6a16ae fs/cifs/cifsproto.h       Pavel Shilovsky            2016-11-17   87  				struct mid_q_entry *mid);
49024ec8795ed2 fs/smb/client/cifsproto.h Paulo Alcantara            2023-06-27   88  extern char *smb3_fs_context_fullpath(const struct smb3_fs_context *ctx,
49024ec8795ed2 fs/smb/client/cifsproto.h Paulo Alcantara            2023-06-27   89  				      char dirsep);
66e7b09c731175 fs/cifs/cifsproto.h       Ronnie Sahlberg            2020-11-05   90  extern int smb3_parse_devname(const char *devname, struct smb3_fs_context *ctx);
0d4873f9aa4ff8 fs/cifs/cifsproto.h       Ronnie Sahlberg            2021-01-28   91  extern int smb3_parse_opt(const char *options, const char *key, char **val);
2991b77409891e fs/smb/client/cifsproto.h Shyam Prasad N             2023-06-09   92  extern int cifs_ipaddr_cmp(struct sockaddr *srcaddr, struct sockaddr *rhs);
e4af35fa55b072 fs/cifs/cifsproto.h       Paulo Alcantara            2020-05-19   93  extern bool cifs_match_ipaddr(struct sockaddr *srcaddr, struct sockaddr *rhs);
350be257ea8302 fs/cifs/cifsproto.h       Pavel Shilovsky            2017-04-10   94  extern int cifs_discard_remaining_data(struct TCP_Server_Info *server);
fec344e3f31aa9 fs/cifs/cifsproto.h       Jeff Layton                2012-09-18   95  extern int cifs_call_async(struct TCP_Server_Info *server,
fec344e3f31aa9 fs/cifs/cifsproto.h       Jeff Layton                2012-09-18   96  			struct smb_rqst *rqst,
fec344e3f31aa9 fs/cifs/cifsproto.h       Jeff Layton                2012-09-18  @97  			mid_receive_t *receive, mid_callback_t *callback,
3349c3a79fb5d7 fs/cifs/cifsproto.h       Pavel Shilovsky            2019-01-15  @98  			mid_handle_t *handle, void *cbdata, const int flags,
3349c3a79fb5d7 fs/cifs/cifsproto.h       Pavel Shilovsky            2019-01-15   99  			const struct cifs_credits *exist_credits);
5f68ea4aa98bcd fs/cifs/cifsproto.h       Aurelien Aptel             2020-04-22 @100  extern struct TCP_Server_Info *cifs_pick_channel(struct cifs_ses *ses);
b8f57ee8aad414 fs/cifs/cifsproto.h       Pavel Shilovsky            2016-11-23  101  extern int cifs_send_recv(const unsigned int xid, struct cifs_ses *ses,
352d96f3acc6e0 fs/cifs/cifsproto.h       Aurelien Aptel             2020-05-31  102  			  struct TCP_Server_Info *server,
b8f57ee8aad414 fs/cifs/cifsproto.h       Pavel Shilovsky            2016-11-23  103  			  struct smb_rqst *rqst, int *resp_buf_type,
b8f57ee8aad414 fs/cifs/cifsproto.h       Pavel Shilovsky            2016-11-23  104  			  const int flags, struct kvec *resp_iov);
e0bba0b8548179 fs/cifs/cifsproto.h       Ronnie Sahlberg            2018-08-01  105  extern int compound_send_recv(const unsigned int xid, struct cifs_ses *ses,
352d96f3acc6e0 fs/cifs/cifsproto.h       Aurelien Aptel             2020-05-31  106  			      struct TCP_Server_Info *server,
e0bba0b8548179 fs/cifs/cifsproto.h       Ronnie Sahlberg            2018-08-01  107  			      const int flags, const int num_rqst,
e0bba0b8548179 fs/cifs/cifsproto.h       Ronnie Sahlberg            2018-08-01  108  			      struct smb_rqst *rqst, int *resp_buf_type,
e0bba0b8548179 fs/cifs/cifsproto.h       Ronnie Sahlberg            2018-08-01  109  			      struct kvec *resp_iov);
96daf2b09178d8 fs/cifs/cifsproto.h       Steve French               2011-05-27  110  extern int SendReceive(const unsigned int /* xid */ , struct cifs_ses *,
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16  111  			struct smb_hdr * /* input */ ,
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16  112  			struct smb_hdr * /* out */ ,
a891f0f895f4a7 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-05-23  113  			int * /* bytes returned */ , const int);
96daf2b09178d8 fs/cifs/cifsproto.h       Steve French               2011-05-27  114  extern int SendReceiveNoRsp(const unsigned int xid, struct cifs_ses *ses,
792af7b05b8a78 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-03-23  115  			    char *in_buf, int flags);
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  116  int cifs_sync_mid_result(struct mid_q_entry *mid, struct TCP_Server_Info *server);
fec344e3f31aa9 fs/cifs/cifsproto.h       Jeff Layton                2012-09-18  117  extern struct mid_q_entry *cifs_setup_request(struct cifs_ses *,
f780bd3fef17c4 fs/cifs/cifsproto.h       Aurelien Aptel             2019-09-20  118  				struct TCP_Server_Info *,
fec344e3f31aa9 fs/cifs/cifsproto.h       Jeff Layton                2012-09-18  119  				struct smb_rqst *);
fec344e3f31aa9 fs/cifs/cifsproto.h       Jeff Layton                2012-09-18  120  extern struct mid_q_entry *cifs_setup_async_request(struct TCP_Server_Info *,
fec344e3f31aa9 fs/cifs/cifsproto.h       Jeff Layton                2012-09-18  121  						struct smb_rqst *);
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  122  int __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  123  		    struct smb_rqst *rqst);
2c8f981d93f830 fs/cifs/cifsproto.h       Jeff Layton                2011-05-19  124  extern int cifs_check_receive(struct mid_q_entry *mid,
2c8f981d93f830 fs/cifs/cifsproto.h       Jeff Layton                2011-05-19  125  			struct TCP_Server_Info *server, bool log_error);
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  126  int wait_for_free_request(struct TCP_Server_Info *server, const int flags,
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  127  			  unsigned int *instance);
cb7e9eabb2b584 fs/cifs/cifsproto.h       Pavel Shilovsky            2014-06-05  128  extern int cifs_wait_mtu_credits(struct TCP_Server_Info *server,
56257334e8e007 fs/smb/client/cifsproto.h David Howells              2023-10-06  129  				 size_t size, size_t *num,
335b7b62ffb69d fs/cifs/cifsproto.h       Pavel Shilovsky            2019-01-16 @130  				 struct cifs_credits *credits);
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  131  
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  132  static inline int
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  133  send_cancel(struct TCP_Server_Info *server, struct smb_rqst *rqst,
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  134  	    struct mid_q_entry *mid)
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  135  {
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05 @136  	return server->ops->send_cancel ?
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  137  				server->ops->send_cancel(server, rqst, mid) : 0;
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  138  }
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  139  
1cdd5a2626d8c9 fs/smb/client/cifsproto.h Steve French               2025-08-05  140  int wait_for_response(struct TCP_Server_Info *server, struct mid_q_entry *midQ);
96daf2b09178d8 fs/cifs/cifsproto.h       Steve French               2011-05-27  141  extern int SendReceive2(const unsigned int /* xid */ , struct cifs_ses *,
84afc29b185334 fs/cifs/cifsproto.h       Steve French               2005-12-02  142  			struct kvec *, int /* nvec to send */,
da502f7df03d2d fs/cifs/cifsproto.h       Pavel Shilovsky            2016-10-25  143  			int * /* type of buf returned */, const int flags,
da502f7df03d2d fs/cifs/cifsproto.h       Pavel Shilovsky            2016-10-25  144  			struct kvec * /* resp vec */);
ad7a2926b9e53c fs/cifs/cifsproto.h       Steve French               2008-02-07  145  extern int SendReceiveBlockingLock(const unsigned int xid,
96daf2b09178d8 fs/cifs/cifsproto.h       Steve French               2011-05-27  146  			struct cifs_tcon *ptcon,
ad7a2926b9e53c fs/cifs/cifsproto.h       Steve French               2008-02-07  147  			struct smb_hdr *in_buf,
ad7a2926b9e53c fs/cifs/cifsproto.h       Steve French               2008-02-07  148  			struct smb_hdr *out_buf,
ad7a2926b9e53c fs/cifs/cifsproto.h       Steve French               2008-02-07  149  			int *bytes_returned);
705fc522fe9d58 fs/smb/client/cifsproto.h Shyam Prasad N             2023-10-13  150  
74ebd02163fde0 fs/smb/client/cifsproto.h Shyam Prasad N             2025-06-30  151  void smb2_query_server_interfaces(struct work_struct *work);
ba978e83255a75 fs/cifs/cifsproto.h       Shyam Prasad N             2022-01-17  152  void
dca65818c80cf0 fs/cifs/cifsproto.h       Shyam Prasad N             2022-02-15  153  cifs_signal_cifsd_for_reconnect(struct TCP_Server_Info *server,
dca65818c80cf0 fs/cifs/cifsproto.h       Shyam Prasad N             2022-02-15  154  				      bool all_channels);
dca65818c80cf0 fs/cifs/cifsproto.h       Shyam Prasad N             2022-02-15  155  void
ba978e83255a75 fs/cifs/cifsproto.h       Shyam Prasad N             2022-01-17  156  cifs_mark_tcp_ses_conns_for_reconnect(struct TCP_Server_Info *server,
ba978e83255a75 fs/cifs/cifsproto.h       Shyam Prasad N             2022-01-17  157  				      bool mark_smb_session);
183eea2ee5ba96 fs/cifs/cifsproto.h       Shyam Prasad N             2021-07-19  158  extern int cifs_reconnect(struct TCP_Server_Info *server,
183eea2ee5ba96 fs/cifs/cifsproto.h       Shyam Prasad N             2021-07-19  159  			  bool mark_smb_session);
373512ec5c105e fs/cifs/cifsproto.h       Steve French               2015-12-18  160  extern int checkSMB(char *buf, unsigned int len, struct TCP_Server_Info *srvr);
d4e4854fd1c85a fs/cifs/cifsproto.h       Pavel Shilovsky            2012-03-23  161  extern bool is_valid_oplock_break(char *, struct TCP_Server_Info *);
3d3ea8e64efbeb fs/cifs/cifsproto.h       Shirish Pargaonkar         2011-09-26  162  extern bool backup_cred(struct cifs_sb_info *);
e4b61f3b1c67f5 fs/smb/client/cifsproto.h Bharath SM                 2024-02-29 @163  extern bool is_size_safe_to_change(struct cifsInodeInfo *cifsInode, __u64 eof,
e4b61f3b1c67f5 fs/smb/client/cifsproto.h Bharath SM                 2024-02-29  164  				   bool from_readdir);
72432ffcf555de fs/cifs/cifsproto.h       Pavel Shilovsky            2011-01-24  165  extern void cifs_update_eof(struct cifsInodeInfo *cifsi, loff_t offset,
72432ffcf555de fs/cifs/cifsproto.h       Pavel Shilovsky            2011-01-24  166  			    unsigned int bytes_written);
20d72b00ca814d fs/smb/client/cifsproto.h David Howells              2025-05-19 @167  void cifs_write_subrequest_terminated(struct cifs_io_subrequest *wdata, ssize_t result);
86f740f2aed5ea fs/cifs/cifsproto.h       Aurelien Aptel             2020-02-21  168  extern struct cifsFileInfo *find_writable_file(struct cifsInodeInfo *, int);
fe768d51c832eb fs/cifs/cifsproto.h       Pavel Shilovsky            2019-01-29  169  extern int cifs_get_writable_file(struct cifsInodeInfo *cifs_inode,
86f740f2aed5ea fs/cifs/cifsproto.h       Aurelien Aptel             2020-02-21  170  				  int flags,
fe768d51c832eb fs/cifs/cifsproto.h       Pavel Shilovsky            2019-01-29  171  				  struct cifsFileInfo **ret_file);
8de9e86c67baa7 fs/cifs/cifsproto.h       Ronnie Sahlberg            2019-08-30  172  extern int cifs_get_writable_path(struct cifs_tcon *tcon, const char *name,
86f740f2aed5ea fs/cifs/cifsproto.h       Aurelien Aptel             2020-02-21  173  				  int flags,
8de9e86c67baa7 fs/cifs/cifsproto.h       Ronnie Sahlberg            2019-08-30  174  				  struct cifsFileInfo **ret_file);
6508d904e6fb66 fs/cifs/cifsproto.h       Jeff Layton                2010-09-29  175  extern struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *, bool);
496902dc173dea fs/cifs/cifsproto.h       Ronnie Sahlberg            2019-09-09  176  extern int cifs_get_readable_path(struct cifs_tcon *tcon, const char *name,
496902dc173dea fs/cifs/cifsproto.h       Ronnie Sahlberg            2019-09-09  177  				  struct cifsFileInfo **ret_file);
262b73ef442e68 fs/smb/client/cifsproto.h Chunjie Zhu                2025-04-12  178  extern int cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *inode,
262b73ef442e68 fs/smb/client/cifsproto.h Chunjie Zhu                2025-04-12  179  				  struct file *file);
68ed14496b032b fs/cifs/cifsproto.h       Enzo Matsumiya             2022-08-17  180  extern unsigned int smbCalcSize(void *buf);
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16  181  extern int decode_negTokenInit(unsigned char *security_blob, int length,
26efa0bac9dc35 fs/cifs/cifsproto.h       Jeff Layton                2010-04-24  182  			struct TCP_Server_Info *server);
67b7626a0512d1 fs/cifs/cifsproto.h       David Howells              2010-07-22  183  extern int cifs_convert_address(struct sockaddr *dst, const char *src, int len);
b979aaa1777259 fs/cifs/cifsproto.h       Jeff Layton                2012-11-26  184  extern void cifs_set_port(struct sockaddr *addr, const unsigned short int port);
5ffef7bf1dd582 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-03-23  185  extern int map_smb_to_linux_error(char *buf, bool logErr);
a3713ec3d775ff fs/cifs/cifsproto.h       Roberto Bergantinos Corpas 2020-07-03  186  extern int map_and_check_smb_error(struct mid_q_entry *mid, bool logErr);
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16  187  extern void header_assemble(struct smb_hdr *, char /* command */ ,
96daf2b09178d8 fs/cifs/cifsproto.h       Steve French               2011-05-27  188  			    const struct cifs_tcon *, int /* length of
1982c344f1bf08 fs/cifs/cifsproto.h       Steve French               2005-08-17  189  			    fixed section (word count) in two byte units */);
5815449d1bfcb2 fs/cifs/cifsproto.h       Steve French               2006-02-14  190  extern int small_smb_init_no_tc(const int smb_cmd, const int wct,
96daf2b09178d8 fs/cifs/cifsproto.h       Steve French               2011-05-27  191  				struct cifs_ses *ses,
12b3b8ffb5fd59 fs/cifs/cifsproto.h       Steve French               2006-02-09  192  				void **request_buf);
3f618223dc0bdc fs/cifs/cifsproto.h       Jeff Layton                2013-06-12  193  extern enum securityEnum select_sectype(struct TCP_Server_Info *server,
3f618223dc0bdc fs/cifs/cifsproto.h       Jeff Layton                2013-06-12  194  				enum securityEnum requested);
58c45c58a1cbc8 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-05-25  195  extern int CIFS_SessSetup(const unsigned int xid, struct cifs_ses *ses,
f486ef8e2003f6 fs/cifs/cifsproto.h       Shyam Prasad N             2021-07-19  196  			  struct TCP_Server_Info *server,
5815449d1bfcb2 fs/cifs/cifsproto.h       Steve French               2006-02-14  197  			  const struct nls_table *nls_cp);
95390201e7d8dd fs/cifs/cifsproto.h       Arnd Bergmann              2018-06-19  198  extern struct timespec64 cifs_NTtimeToUnix(__le64 utc_nanoseconds_since_1601);
95390201e7d8dd fs/cifs/cifsproto.h       Arnd Bergmann              2018-06-19  199  extern u64 cifs_UnixTimeToNT(struct timespec64);
95390201e7d8dd fs/cifs/cifsproto.h       Arnd Bergmann              2018-06-19  200  extern struct timespec64 cnvrtDosUnixTm(__le16 le_date, __le16 le_time,
c4a2c08db7d976 fs/cifs/cifsproto.h       Jeff Layton                2009-05-27  201  				      int offset);
c67236281c5d74 fs/cifs/cifsproto.h       Pavel Shilovsky            2010-11-03  202  extern void cifs_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock);
c11f1df5003d53 fs/cifs/cifsproto.h       Sachin Prabhu              2014-03-11  203  extern int cifs_get_writer(struct cifsInodeInfo *cinode);
c11f1df5003d53 fs/cifs/cifsproto.h       Sachin Prabhu              2014-03-11  204  extern void cifs_put_writer(struct cifsInodeInfo *cinode);
c11f1df5003d53 fs/cifs/cifsproto.h       Sachin Prabhu              2014-03-11  205  extern void cifs_done_oplock_break(struct cifsInodeInfo *cinode);
d39a4f710b7a7b fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19  206  extern int cifs_unlock_range(struct cifsFileInfo *cfile,
d39a4f710b7a7b fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19  207  			     struct file_lock *flock, const unsigned int xid);
d39a4f710b7a7b fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19  208  extern int cifs_push_mandatory_locks(struct cifsFileInfo *cfile);
1bd5bbcb653177 fs/cifs/cifsproto.h       Steve French               2006-09-28  209  
d46b0da7a33dd8 fs/cifs/cifsproto.h       Dave Wysochanski           2019-10-23  210  extern void cifs_down_write(struct rw_semaphore *sem);
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara            2022-10-03 @211  struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fid *fid, struct file *file,
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara            2022-10-03  212  				       struct tcon_link *tlink, __u32 oplock,
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara            2022-10-03  213  				       const char *symlink_target);
f6f1f1790775fb fs/cifs/cifsproto.h       Al Viro                    2021-03-18  214  extern int cifs_posix_open(const char *full_path, struct inode **inode,
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky            2012-06-20  215  			   struct super_block *sb, int mode,
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky            2012-06-20  216  			   unsigned int f_flags, __u32 *oplock, __u16 *netfid,
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky            2012-06-20  217  			   unsigned int xid);
4065c802da7484 fs/cifs/cifsproto.h       Jeff Layton                2010-05-17 @218  void cifs_fill_uniqueid(struct super_block *sb, struct cifs_fattr *fattr);
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton                2009-06-25  219  extern void cifs_unix_basic_to_fattr(struct cifs_fattr *fattr,
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton                2009-06-25  220  				     FILE_UNIX_BASIC_INFO *info,
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton                2009-06-25  221  				     struct cifs_sb_info *cifs_sb);
c052e2b423f3ea fs/cifs/cifsproto.h       Shirish Pargaonkar         2012-09-28  222  extern void cifs_dir_info_to_fattr(struct cifs_fattr *, FILE_DIRECTORY_INFO *,
c052e2b423f3ea fs/cifs/cifsproto.h       Shirish Pargaonkar         2012-09-28  223  					struct cifs_sb_info *);
e4b61f3b1c67f5 fs/smb/client/cifsproto.h Bharath SM                 2024-02-29  224  extern int cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr,
e4b61f3b1c67f5 fs/smb/client/cifsproto.h Bharath SM                 2024-02-29  225  			       bool from_readdir);
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton                2009-06-25  226  extern struct inode *cifs_iget(struct super_block *sb,
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton                2009-06-25  227  			       struct cifs_fattr *fattr);
cc0bad7552308e fs/cifs/cifsproto.h       Jeff Layton                2009-06-25  228  
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara            2022-10-03  229  int cifs_get_inode_info(struct inode **inode, const char *full_path,
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara            2022-10-03 @230  			struct cifs_open_info_data *data, struct super_block *sb, int xid,
76894f3e2f7117 fs/cifs/cifsproto.h       Paulo Alcantara            2022-10-03  231  			const struct cifs_fid *fid);
102466f303ffcd fs/smb/client/cifsproto.h Paulo Alcantara            2023-11-25  232  extern int smb311_posix_get_inode_info(struct inode **inode,
102466f303ffcd fs/smb/client/cifsproto.h Paulo Alcantara            2023-11-25  233  				       const char *full_path,
102466f303ffcd fs/smb/client/cifsproto.h Paulo Alcantara            2023-11-25  234  				       struct cifs_open_info_data *data,
102466f303ffcd fs/smb/client/cifsproto.h Paulo Alcantara            2023-11-25  235  				       struct super_block *sb,
102466f303ffcd fs/smb/client/cifsproto.h Paulo Alcantara            2023-11-25  236  				       const unsigned int xid);
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16  237  extern int cifs_get_inode_info_unix(struct inode **pinode,
^1da177e4c3f41 fs/cifs/cifsproto.h       Linus Torvalds             2005-04-16  238  			const unsigned char *search_path,
6d5786a34d98bf fs/cifs/cifsproto.h       Pavel Shilovsky            2012-06-20  239  			struct super_block *sb, unsigned int xid);
ed6875e0d6c28e fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-18  240  extern int cifs_set_file_info(struct inode *inode, struct iattr *attrs,
f6f1f1790775fb fs/cifs/cifsproto.h       Al Viro                    2021-03-18  241  			      unsigned int xid, const char *full_path, __u32 dosattr);
ed6875e0d6c28e fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-18  242  extern int cifs_rename_pending_delete(const char *full_path,
ed6875e0d6c28e fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-18  243  				      struct dentry *dentry,
ed6875e0d6c28e fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-18  244  				      const unsigned int xid);
7f599d8fb3e087 fs/smb/client/cifsproto.h ChenXiaoSong               2024-08-22 @245  extern int sid_to_id(struct cifs_sb_info *cifs_sb, struct smb_sid *psid,
9934430e2178d5 fs/cifs/cifsproto.h       Steve French               2020-10-20  246  				struct cifs_fattr *fattr, uint sidtype);
987b21d7d91d03 fs/cifs/cifsproto.h       Shirish Pargaonkar         2010-11-10  247  extern int cifs_acl_to_fattr(struct cifs_sb_info *cifs_sb,
0b8f18e358384a fs/cifs/cifsproto.h       Jeff Layton                2009-07-09  248  			      struct cifs_fattr *fattr, struct inode *inode,
e2f8fbfb8d09c0 fs/cifs/cifsproto.h       Steve French               2019-07-19  249  			      bool get_mode_from_special_sid,
42eacf9e57b65f fs/cifs/cifsproto.h       Steve French               2014-02-10  250  			      const char *path, const struct cifs_fid *pfid);
0f22053e811ca5 fs/cifs/cifsproto.h       Shyam Prasad N             2020-08-17  251  extern int id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64 *pnmode,
0f22053e811ca5 fs/cifs/cifsproto.h       Shyam Prasad N             2020-08-17  252  					kuid_t uid, kgid_t gid);
3651487607ae77 fs/smb/client/cifsproto.h ChenXiaoSong               2024-08-22  253  extern struct smb_ntsd *get_cifs_acl(struct cifs_sb_info *cifssmb, struct inode *ino,
3651487607ae77 fs/smb/client/cifsproto.h ChenXiaoSong               2024-08-22  254  				      const char *path, u32 *plen, u32 info);
3651487607ae77 fs/smb/client/cifsproto.h ChenXiaoSong               2024-08-22  255  extern struct smb_ntsd *get_cifs_acl_by_fid(struct cifs_sb_info *cifssb,
3651487607ae77 fs/smb/client/cifsproto.h ChenXiaoSong               2024-08-22  256  				const struct cifs_fid *pfid, u32 *plen, u32 info);
77435322777d8a fs/cifs/cifsproto.h       Christian Brauner          2023-01-13  257  extern struct posix_acl *cifs_get_acl(struct mnt_idmap *idmap,
bd9684b042dcbb fs/cifs/cifsproto.h       Christian Brauner          2022-09-22  258  				      struct dentry *dentry, int type);
13e83a4923bea7 fs/cifs/cifsproto.h       Christian Brauner          2023-01-13  259  extern int cifs_set_acl(struct mnt_idmap *idmap,
dc1af4c4b4721a fs/cifs/cifsproto.h       Christian Brauner          2022-09-22  260  			struct dentry *dentry, struct posix_acl *acl, int type);
3651487607ae77 fs/smb/client/cifsproto.h ChenXiaoSong               2024-08-22  261  extern int set_cifs_acl(struct smb_ntsd *pntsd, __u32 len, struct inode *ino,
3651487607ae77 fs/smb/client/cifsproto.h ChenXiaoSong               2024-08-22  262  				const char *path, int flag);
09bedafc1e2c5c fs/smb/client/cifsproto.h ChenXiaoSong               2024-08-22 @263  extern unsigned int setup_authusers_ACE(struct smb_ace *pace);
d413eabff18d64 fs/smb/client/cifsproto.h Ralph Boehme               2024-11-14  264  extern unsigned int setup_special_mode_ACE(struct smb_ace *pace,
d413eabff18d64 fs/smb/client/cifsproto.h Ralph Boehme               2024-11-14  265  					   bool posix,
d413eabff18d64 fs/smb/client/cifsproto.h Ralph Boehme               2024-11-14  266  					   __u64 nmode);
09bedafc1e2c5c fs/smb/client/cifsproto.h ChenXiaoSong               2024-08-22  267  extern unsigned int setup_special_user_owner_ACE(struct smb_ace *pace);
953f868138dbf4 fs/cifs/cifsproto.h       Steve French               2007-10-31  268  
e28bc5b1fdbd6e fs/cifs/cifsproto.h       Jeff Layton                2011-10-19  269  extern void dequeue_mid(struct mid_q_entry *mid, bool malformed);
e28bc5b1fdbd6e fs/cifs/cifsproto.h       Jeff Layton                2011-10-19  270  extern int cifs_read_from_socket(struct TCP_Server_Info *server, char *buf,
e28bc5b1fdbd6e fs/cifs/cifsproto.h       Jeff Layton                2011-10-19  271  			         unsigned int to_read);
cf0604a686b111 fs/cifs/cifsproto.h       David Howells              2021-02-04  272  extern ssize_t cifs_discard_from_socket(struct TCP_Server_Info *server,
cf0604a686b111 fs/cifs/cifsproto.h       David Howells              2021-02-04  273  					size_t to_read);
16541195c6d9bc fs/cifs/cifsproto.h       David Howells              2022-04-06  274  int cifs_read_iter_from_socket(struct TCP_Server_Info *server,
16541195c6d9bc fs/cifs/cifsproto.h       David Howells              2022-04-06  275  			       struct iov_iter *iter,
16541195c6d9bc fs/cifs/cifsproto.h       David Howells              2022-04-06  276  			       unsigned int to_read);
51acd208bd57c8 fs/cifs/cifsproto.h       Ronnie Sahlberg            2020-12-14  277  extern int cifs_setup_cifs_sb(struct cifs_sb_info *cifs_sb);
a1c0d00572fca4 fs/cifs/cifsproto.h       Paulo Alcantara            2022-11-17 @278  void cifs_mount_put_conns(struct cifs_mount_ctx *mnt_ctx);
a73a26d97eca08 fs/cifs/cifsproto.h       Paulo Alcantara            2022-10-11  279  int cifs_mount_get_session(struct cifs_mount_ctx *mnt_ctx);
a1c0d00572fca4 fs/cifs/cifsproto.h       Paulo Alcantara            2022-11-17  280  int cifs_is_path_remote(struct cifs_mount_ctx *mnt_ctx);
a73a26d97eca08 fs/cifs/cifsproto.h       Paulo Alcantara            2022-10-11  281  int cifs_mount_get_tcon(struct cifs_mount_ctx *mnt_ctx);
724d9f1cfba0cb fs/cifs/cifsproto.h       Pavel Shilovsky            2011-05-05  282  extern int cifs_match_super(struct super_block *, void *);
3fa1c6d1b8f5c3 fs/cifs/cifsproto.h       Ronnie Sahlberg            2020-12-09  283  extern int cifs_mount(struct cifs_sb_info *cifs_sb, struct smb3_fs_context *ctx);
2a9b99516c662d fs/cifs/cifsproto.h       Al Viro                    2011-06-17  284  extern void cifs_umount(struct cifs_sb_info *);
aa24d1e9692411 fs/cifs/cifsproto.h       Pavel Shilovsky            2011-12-27  285  extern void cifs_mark_open_files_invalid(struct cifs_tcon *tcon);
52ace1ef1259e1 fs/cifs/cifsproto.h       Steve French               2016-09-22  286  extern void cifs_reopen_persistent_handles(struct cifs_tcon *tcon);
52ace1ef1259e1 fs/cifs/cifsproto.h       Steve French               2016-09-22  287  
579f9053236c79 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19  288  extern bool cifs_find_lock_conflict(struct cifsFileInfo *cfile, __u64 offset,
9645759ce6b390 fs/cifs/cifsproto.h       Ronnie Sahlberg            2018-10-04  289  				    __u64 length, __u8 type, __u16 flags,
579f9053236c79 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19 @290  				    struct cifsLockInfo **conf_lock,
081c0414dcdfd1 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-11-27  291  				    int rw_check);
233839b1df65a2 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19  292  extern void cifs_add_pending_open(struct cifs_fid *fid,
233839b1df65a2 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19  293  				  struct tcon_link *tlink,
233839b1df65a2 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19 @294  				  struct cifs_pending_open *open);
233839b1df65a2 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19  295  extern void cifs_add_pending_open_locked(struct cifs_fid *fid,
233839b1df65a2 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19  296  					 struct tcon_link *tlink,
233839b1df65a2 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19  297  					 struct cifs_pending_open *open);
233839b1df65a2 fs/cifs/cifsproto.h       Pavel Shilovsky            2012-09-19  298  extern void cifs_del_pending_open(struct cifs_pending_open *open);
c3f207ab29f793 fs/cifs/cifsproto.h       Rohith Surabattula         2021-04-13  299  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
