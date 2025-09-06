Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283B2274FED
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 18:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757182579; cv=none; b=khzASA0DT4CEJfkxxRPnqvUjBQfzGnBtQ7+1ntL7wc9fAj8DiQBf7Hwf8ZGWy6zaYwvP2eSiwaF18j+hy+RAGBSvMTDFafhXwfKJLUp2OscpKj1wWUutExfOaMwpg2ypKpZJsPbuAw3kJ0d/7P9K6RHeyjmhz1+jevz1KRkZ+AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757182579; c=relaxed/simple;
	bh=FChQRZqGNP9l2pwZ1A1whfVzyjAUhtDdf8pSWF1m8XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/Hg2lCbhXlrZ9Z1PepFGaEmzNl5TJe/EyNdP0oKu3QG3OCHnP+afc1nyZtaGxCI1LhAIlmgONLf09vIFFN+rBPypF4GubNSBmL5U7NgHBDGGdDq5GbnuIQKGs1OqeORpnjkuF1oJCQORLkuncCWUkuI7no30yMwyWRlpVXiRDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8wKba9P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8wKba9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757182576; x=1788718576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FChQRZqGNP9l2pwZ1A1whfVzyjAUhtDdf8pSWF1m8XM=;
  b=V8wKba9PrJSvsnqZVKEWVedKL7Q7sz/vOAwCrxxGxe5Nns6zVdn1B2au
   C+KYzTyC5YUGl7HGYudSG+IEcPL+QjuodrKITyN+q4x7zniv/YTjkeT65
   IXSwPzr86exRiN12v1DX2EJd9g4kPEq9B9uFKASZLV4htwsbJRKKajKsR
   4HpQtgq8JWBLcjvFylyDOaKn6ab2jnXfoXcx5xuWlBfr5F3GM7bn4YhuJ
   w2M1LHV0UUld6v0szj5TexKlD/oVGVGmoEbrWHpWss157YVo9mvOiC0Of
   ySTfEwI51gTtkJINJk08I2nLV11AB2mPY4/errYRsr5bJlEJ5C4yte8kr
   w==;
X-CSE-ConnectionGUID: OY7MJyNZRnqlyftXzuT4fA==
X-CSE-MsgGUID: zlSqRADOTHW79vhOJxv9+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="77113045"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="77113045"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 11:16:13 -0700
X-CSE-ConnectionGUID: tCOH3zDcSFGfX2lzAQ0lzg==
X-CSE-MsgGUID: EI97VIyZTz2YxrruqlVdUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="173236468"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Sep 2025 11:16:12 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuxSM-0001jL-04;
	Sat, 06 Sep 2025 18:16:10 +0000
Date: Sun, 7 Sep 2025 02:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] cifs: Clean up declarations
Message-ID: <202509070128.sXwdpAVr-lkp@intel.com>
References: <20250904211839.1152340-3-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904211839.1152340-3-dhowells@redhat.com>

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
patch link:    https://lore.kernel.org/r/20250904211839.1152340-3-dhowells%40redhat.com
patch subject: [RFC PATCH 2/2] cifs: Clean up declarations
config: sh-randconfig-001-20250906 (https://download.01.org/0day-ci/archive/20250907/202509070128.sXwdpAVr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070128.sXwdpAVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070128.sXwdpAVr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/smb/client/smb2inode.c:18:
>> fs/smb/client/cifsproto.h:204:27: warning: 'struct dfs_cache_tgt_list' declared inside parameter list will not be visible outside of this definition or declaration
     204 |                    struct dfs_cache_tgt_list *tgt_list);
         |                           ^~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:206:33: warning: 'struct dfs_cache_tgt_list' declared inside parameter list will not be visible outside of this definition or declaration
     206 |                          struct dfs_cache_tgt_list *tgt_list);
         |                                 ^~~~~~~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:207:68: warning: 'struct dfs_cache_tgt_iterator' declared inside parameter list will not be visible outside of this definition or declaration
     207 | void dfs_cache_noreq_update_tgthint(const char *path, const struct dfs_cache_tgt_iterator *it);
         |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:208:63: warning: 'struct dfs_cache_tgt_iterator' declared inside parameter list will not be visible outside of this definition or declaration
     208 | int dfs_cache_get_tgt_referral(const char *path, const struct dfs_cache_tgt_iterator *it,
         |                                                               ^~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:210:54: warning: 'struct dfs_cache_tgt_iterator' declared inside parameter list will not be visible outside of this definition or declaration
     210 | int dfs_cache_get_tgt_share(char *path, const struct dfs_cache_tgt_iterator *it, char **share,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:675:19: error: static declaration of 'cifs_inval_name_dfs_link_error' follows non-static declaration
     675 | static inline int cifs_inval_name_dfs_link_error(const unsigned int xid,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:451:5: note: previous declaration of 'cifs_inval_name_dfs_link_error' with type 'int(const unsigned int,  struct cifs_tcon *, struct cifs_sb_info *, const char *, bool *)' {aka 'int(const unsigned int,  struct cifs_tcon *, struct cifs_sb_info *, const char *, _Bool *)'}
     451 | int cifs_inval_name_dfs_link_error(const unsigned int xid,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
         |                                                            ^~~~~~~~~~
   fs/smb/client/cifsproto.h:68:41: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      68 | void cifs_dump_detail(void *buf, struct TCP_Server_Info *server);
         |                                         ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:69:28: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      69 | void cifs_dump_mids(struct TCP_Server_Info *server);
         |                            ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:80:34: warning: 'struct shash_desc' declared inside parameter list will not be visible outside of this definition or declaration
      80 |                           struct shash_desc *shash);
         |                                  ^~~~~~~~~~
   fs/smb/client/cifsproto.h:79:34: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      79 |                           struct TCP_Server_Info *server, char *signature,
         |                                  ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:81:50: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      81 | int cifs_sign_rqst(struct smb_rqst *rqst, struct TCP_Server_Info *server,
         |                                                  ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:83:56: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      83 | int cifs_sign_smbv(struct kvec *iov, int n_vec, struct TCP_Server_Info *server,
         |                                                        ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:85:52: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      85 | int cifs_sign_smb(struct smb_hdr *cifs_pdu, struct TCP_Server_Info *server,
         |                                                    ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:88:34: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      88 |                           struct TCP_Server_Info *server,
         |                                  ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:90:29: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
      90 | int setup_ntlmv2_rsp(struct cifs_ses *ses, const struct nls_table *nls_cp);
         |                             ^~~~~~~~
   fs/smb/client/cifsproto.h:91:24: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
      91 | int calc_seckey(struct cifs_ses *ses);
         |                        ^~~~~~~~
   fs/smb/client/cifsproto.h:92:41: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
      92 | void cifs_crypto_secmech_release(struct TCP_Server_Info *server);
         |                                         ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:117:28: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     117 |                     struct TCP_Server_Info *server);
         |                            ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:116:40: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     116 | struct key *cifs_get_spnego_key(struct cifs_ses *sesInfo,
         |                                        ^~~~~~~~
   fs/smb/client/cifsproto.h:142:45: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     142 | void cifs_signal_cifsd_for_reconnect(struct TCP_Server_Info *server,
         |                                             ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:144:51: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     144 | void cifs_mark_tcp_ses_conns_for_reconnect(struct TCP_Server_Info *server,
         |                                                   ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:146:27: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     146 | int cifs_reconnect(struct TCP_Server_Info *server, bool mark_smb_session);
         |                           ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:147:34: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     147 | int cifs_read_from_socket(struct TCP_Server_Info *server, char *buf,
         |                                  ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:149:41: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     149 | ssize_t cifs_discard_from_socket(struct TCP_Server_Info *server, size_t to_read);
         |                                         ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:150:39: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     150 | int cifs_read_iter_from_socket(struct TCP_Server_Info *server, struct iov_iter *iter,
         |                                       ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:152:25: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     152 | void dequeue_mid(struct mid_q_entry *mid, bool malformed);
         |                         ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:153:32: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     153 | int cifs_enable_signing(struct TCP_Server_Info *server, bool mnt_sign_required);
         |                                ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:154:65: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     154 | int cifs_handle_standard(struct TCP_Server_Info *server, struct mid_q_entry *mid);
         |                                                                 ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:154:33: warning: 'struct TCP_Server_Info' declared inside parameter list will not be visible outside of this definition or declaration
     154 | int cifs_handle_standard(struct TCP_Server_Info *server, struct mid_q_entry *mid);
         |                                 ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:161:32: warning: 'struct cifs_ses' declared inside parameter list will not be visible outside of this definition or declaration
     161 | void __cifs_put_smb_ses(struct cifs_ses *ses);
         |                                ^~~~~~~~
   fs/smb/client/cifsproto.h:163:27: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     163 | void cifs_put_tcon(struct cifs_tcon *tcon, enum smb3_tcon_ref_trace trace);
         |                           ^~~~~~~~~
   fs/smb/client/cifsproto.h:166:52: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     166 | void reset_cifs_unix_caps(unsigned int xid, struct cifs_tcon *tcon,
         |                                                    ^~~~~~~~~
   fs/smb/client/cifsproto.h:169:34: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     169 | void cifs_mount_put_conns(struct cifs_mount_ctx *mnt_ctx);
         |                                  ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:170:35: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     170 | int cifs_mount_get_session(struct cifs_mount_ctx *mnt_ctx);
         |                                   ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:171:32: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     171 | int cifs_mount_get_tcon(struct cifs_mount_ctx *mnt_ctx);
         |                                ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:172:32: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     172 | int cifs_is_path_remote(struct cifs_mount_ctx *mnt_ctx);
         |                                ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:176:35: warning: 'struct cifs_tcon' declared inside parameter list will not be visible outside of this definition or declaration
     176 |          const char *tree, struct cifs_tcon *tcon,
         |                                   ^~~~~~~~~
   fs/smb/client/cifsproto.h:191:67: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     191 | int dfs_parse_target_referral(const char *full_path, const struct dfs_info3_param *ref,
         |                                                                   ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:193:28: warning: 'struct cifs_mount_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     193 | int dfs_mount_share(struct cifs_mount_ctx *mnt_ctx);
         |                            ^~~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:204:27: warning: 'struct dfs_cache_tgt_list' declared inside parameter list will not be visible outside of this definition or declaration
     204 |                    struct dfs_cache_tgt_list *tgt_list);
         |                           ^~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:203:56: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     203 |                    int remap, const char *path, struct dfs_info3_param *ref,
         |                                                        ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:206:33: warning: 'struct dfs_cache_tgt_list' declared inside parameter list will not be visible outside of this definition or declaration
     206 |                          struct dfs_cache_tgt_list *tgt_list);
         |                                 ^~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:205:51: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     205 | int dfs_cache_noreq_find(const char *path, struct dfs_info3_param *ref,
         |                                                   ^~~~~~~~~~~~~~~
>> fs/smb/client/cifsproto.h:207:68: warning: 'struct dfs_cache_tgt_iterator' declared inside parameter list will not be visible outside of this definition or declaration
     207 | void dfs_cache_noreq_update_tgthint(const char *path, const struct dfs_cache_tgt_iterator *it);
         |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:209:39: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     209 |                                struct dfs_info3_param *ref);
         |                                       ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:208:63: warning: 'struct dfs_cache_tgt_iterator' declared inside parameter list will not be visible outside of this definition or declaration
     208 | int dfs_cache_get_tgt_referral(const char *path, const struct dfs_cache_tgt_iterator *it,
         |                                                               ^~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:210:54: warning: 'struct dfs_cache_tgt_iterator' declared inside parameter list will not be visible outside of this definition or declaration
     210 | int dfs_cache_get_tgt_share(char *path, const struct dfs_cache_tgt_iterator *it, char **share,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:250:47: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     250 | struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fid *fid, struct file *file,
         |                                               ^~~~~~~~
   fs/smb/client/cifsproto.h:263:35: warning: 'struct cifsLockInfo' declared inside parameter list will not be visible outside of this definition or declaration
     263 | void cifs_del_lock_waiters(struct cifsLockInfo *lock);
         |                                   ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h:266:32: warning: 'struct cifsLockInfo' declared inside parameter list will not be visible outside of this definition or declaration
     266 |                         struct cifsLockInfo **conf_lock, int rw_check);
         |                                ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h:276:46: warning: 'struct cifs_io_subrequest' declared inside parameter list will not be visible outside of this definition or declaration
     276 | void cifs_write_subrequest_terminated(struct cifs_io_subrequest *wdata, ssize_t result);
         |                                              ^~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:277:48: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     277 | struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *cifs_inode,
         |                                                ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:279:35: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     279 | int cifs_get_writable_file(struct cifsInodeInfo *cifs_inode, int flags,
         |                                   ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:281:48: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     281 | struct cifsFileInfo *find_writable_file(struct cifsInodeInfo *cifs_inode, int flags);
         |                                                ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:297:36: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     297 | bool is_size_safe_to_change(struct cifsInodeInfo *cifsInode, __u64 end_of_file,
         |                                    ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:318:53: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     318 | int cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr,
         |                                                     ^~~~~~~~~~
   fs/smb/client/cifsproto.h:320:56: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     320 | void cifs_fill_uniqueid(struct super_block *sb, struct cifs_fattr *fattr);
         |                                                        ^~~~~~~~~~
   fs/smb/client/cifsproto.h:321:38: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     321 | void cifs_unix_basic_to_fattr(struct cifs_fattr *fattr, FILE_UNIX_BASIC_INFO *info,
         |                                      ^~~~~~~~~~
   fs/smb/client/cifsproto.h:334:38: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     334 |                         const struct cifs_fid *fid);
         |                                      ^~~~~~~~
   fs/smb/client/cifsproto.h:332:32: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     332 |                         struct cifs_open_info_data *data,
         |                                ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:337:40: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     337 |                                 struct cifs_open_info_data *data,
         |                                        ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:340:56: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     340 | struct inode *cifs_iget(struct super_block *sb, struct cifs_fattr *fattr);
         |                                                        ^~~~~~~~~~
   fs/smb/client/cifsproto.h:375:38: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     375 | bool couldbe_mf_symlink(const struct cifs_fattr *fattr);
         |                                      ^~~~~~~~~~
   fs/smb/client/cifsproto.h:377:55: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     377 |                  struct cifs_sb_info *cifs_sb, struct cifs_fattr *fattr,
         |                                                       ^~~~~~~~~~
   fs/smb/client/cifsproto.h:417:35: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     417 | void cifs_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock);
         |                                   ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:418:28: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     418 | int cifs_get_writer(struct cifsInodeInfo *cinode);
         |                            ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:419:29: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     419 | void cifs_put_writer(struct cifsInodeInfo *cinode);
         |                             ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:421:36: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     421 | void cifs_done_oplock_break(struct cifsInodeInfo *cinode);
         |                                    ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:423:35: warning: 'struct cifs_pending_open' declared inside parameter list will not be visible outside of this definition or declaration
     423 | void cifs_del_pending_open(struct cifs_pending_open *open);
         |                                   ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:425:37: warning: 'struct cifs_pending_open' declared inside parameter list will not be visible outside of this definition or declaration
     425 |                              struct cifs_pending_open *open);
         |                                     ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:424:42: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     424 | void cifs_add_pending_open_locked(struct cifs_fid *fid, struct tcon_link *tlink,
         |                                          ^~~~~~~~
   fs/smb/client/cifsproto.h:427:30: warning: 'struct cifs_pending_open' declared inside parameter list will not be visible outside of this definition or declaration
     427 |                       struct cifs_pending_open *open);
         |                              ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:426:35: warning: 'struct cifs_fid' declared inside parameter list will not be visible outside of this definition or declaration
     426 | void cifs_add_pending_open(struct cifs_fid *fid, struct tcon_link *tlink,
         |                                   ^~~~~~~~
   fs/smb/client/cifsproto.h:428:64: warning: 'struct cifs_deferred_close' declared inside parameter list will not be visible outside of this definition or declaration
     428 | bool cifs_is_deferred_close(struct cifsFileInfo *cfile, struct cifs_deferred_close **pdclose);
         |                                                                ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:429:65: warning: 'struct cifs_deferred_close' declared inside parameter list will not be visible outside of this definition or declaration
     429 | void cifs_add_deferred_close(struct cifsFileInfo *cfile, struct cifs_deferred_close *dclose);
         |                                                                 ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:431:38: warning: 'struct cifsInodeInfo' declared inside parameter list will not be visible outside of this definition or declaration
     431 | void cifs_close_deferred_file(struct cifsInodeInfo *cifs_inode);
         |                                      ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:438:28: warning: 'struct dfs_info3_param' declared inside parameter list will not be visible outside of this definition or declaration
     438 |                     struct dfs_info3_param **target_nodes,
         |                            ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:441:46: warning: 'struct shash_desc' declared inside parameter list will not be visible outside of this definition or declaration
     441 | int cifs_alloc_hash(const char *name, struct shash_desc **sdesc);
         |                                              ^~~~~~~~~~
   fs/smb/client/cifsproto.h:442:28: warning: 'struct shash_desc' declared inside parameter list will not be visible outside of this definition or declaration
     442 | void cifs_free_hash(struct shash_desc **sdesc);
         |                            ^~~~~~~~~~
   fs/smb/client/cifsproto.h:477:36: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     477 | int map_and_check_smb_error(struct mid_q_entry *mid, bool logErr);
         |                                    ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:486:36: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     486 | void cifs_dir_info_to_fattr(struct cifs_fattr *fattr, FILE_DIRECTORY_INFO *info,
         |                                    ^~~~~~~~~~
   fs/smb/client/cifsproto.h:506:32: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     506 |                         struct cifs_open_info_data *data);
         |                                ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:503:32: warning: 'struct reparse_data_buffer' declared inside parameter list will not be visible outside of this definition or declaration
     503 | int parse_reparse_point(struct reparse_data_buffer *buf,
         |                                ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:511:41: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     511 |                                  struct cifs_open_info_data *data);
         |                                         ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:510:41: warning: 'struct cifs_fattr' declared inside parameter list will not be visible outside of this definition or declaration
     510 |                                  struct cifs_fattr *fattr,
         |                                         ^~~~~~~~~~
   fs/smb/client/cifsproto.h:516:54: warning: 'struct cifs_server_iface' declared inside parameter list will not be visible outside of this definition or declaration
     516 | bool is_ses_using_iface(struct cifs_ses *ses, struct cifs_server_iface *iface);
         |                                                      ^~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:565:31: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     565 | void cifs_wake_up_task(struct mid_q_entry *mid);
         |                               ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:567:24: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     567 | void delete_mid(struct mid_q_entry *mid);
         |                        ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:576:43: warning: 'struct cifs_credits' declared inside parameter list will not be visible outside of this definition or declaration
     576 |                       size_t *num, struct cifs_credits *credits);
         |                                           ^~~~~~~~~~~~
   fs/smb/client/cifsproto.h:577:62: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     577 | int wait_for_response(struct TCP_Server_Info *server, struct mid_q_entry *midQ);
         |                                                              ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:579:17: error: unknown type name 'mid_receive_t'
     579 |                 mid_receive_t *receive, mid_callback_t *callback,
         |                 ^~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:579:41: error: unknown type name 'mid_callback_t'; did you mean 'bpf_callback_t'?
     579 |                 mid_receive_t *receive, mid_callback_t *callback,
         |                                         ^~~~~~~~~~~~~~
         |                                         bpf_callback_t
   fs/smb/client/cifsproto.h:580:17: error: unknown type name 'mid_handle_t'; did you mean 'irq_handler_t'?
     580 |                 mid_handle_t *handle, void *cbdata, const int flags,
         |                 ^~~~~~~~~~~~
         |                 irq_handler_t
   fs/smb/client/cifsproto.h:582:33: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     582 | int cifs_sync_mid_result(struct mid_q_entry *mid, struct TCP_Server_Info *server);
         |                                 ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:593:63: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     593 | int cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid);
         |                                                               ^~~~~~~~~~~
   fs/smb/client/cifsproto.h:645:20: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     645 |             struct mid_q_entry *mid)
         |                    ^~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'send_cancel':
   fs/smb/client/cifsproto.h:647:22: error: invalid use of undefined type 'struct TCP_Server_Info'
     647 |         return server->ops->send_cancel ?
         |                      ^~
   fs/smb/client/cifsproto.h:648:39: error: invalid use of undefined type 'struct TCP_Server_Info'
     648 |                                 server->ops->send_cancel(server, rqst, mid) : 0;
         |                                       ^~
   fs/smb/client/cifsproto.h: At top level:
>> fs/smb/client/cifsproto.h:675:19: error: static declaration of 'cifs_inval_name_dfs_link_error' follows non-static declaration
     675 | static inline int cifs_inval_name_dfs_link_error(const unsigned int xid,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:451:5: note: previous declaration of 'cifs_inval_name_dfs_link_error' with type 'int(const unsigned int,  struct cifs_tcon *, struct cifs_sb_info *, const char *, bool *)' {aka 'int(const unsigned int,  struct cifs_tcon *, struct cifs_sb_info *, const char *, _Bool *)'}
     451 | int cifs_inval_name_dfs_link_error(const unsigned int xid,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'cifs_put_smb_ses':
>> fs/smb/client/cifsproto.h:696:28: error: passing argument 1 of '__cifs_put_smb_ses' from incompatible pointer type [-Wincompatible-pointer-types]
     696 |         __cifs_put_smb_ses(ses);
         |                            ^~~
         |                            |
         |                            struct cifs_ses *
   fs/smb/client/cifsproto.h:161:42: note: expected 'struct cifs_ses *' but argument is of type 'struct cifs_ses *'
     161 | void __cifs_put_smb_ses(struct cifs_ses *ses);
         |                         ~~~~~~~~~~~~~~~~~^~~
   In file included from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from fs/smb/client/cifs_unicode.c:7:
   fs/smb/client/cifsproto.h: In function 'cifs_smb_ses_inc_refcount':
   fs/smb/client/cifsproto.h:709:30: error: 'cifs_tcp_ses_lock' undeclared (first use in this function); did you mean 'cifs_posix_lock'?
     709 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:392:61: note: in definition of macro 'lockdep_assert_held'
     392 | #define lockdep_assert_held(l)                  do { (void)(l); } while (0)
         |                                                             ^
   fs/smb/client/cifsproto.h:709:30: note: each undeclared identifier is reported only once for each function it appears in
     709 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:392:61: note: in definition of macro 'lockdep_assert_held'
     392 | #define lockdep_assert_held(l)                  do { (void)(l); } while (0)
         |                                                             ^
   fs/smb/client/cifsproto.h:710:12: error: invalid use of undefined type 'struct cifs_ses'
     710 |         ses->ses_count++;
         |            ^~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:727:39: warning: 'struct mid_q_entry' declared inside parameter list will not be visible outside of this definition or declaration
     727 | static inline void release_mid(struct mid_q_entry *mid)
         |                                       ^~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'release_mid':
   fs/smb/client/cifsproto.h:729:22: error: invalid use of undefined type 'struct mid_q_entry'
     729 |         kref_put(&mid->refcount, __release_mid);
         |                      ^~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:732:47: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     732 | static inline void cifs_free_open_info(struct cifs_open_info_data *data)
         |                                               ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'cifs_free_open_info':
   fs/smb/client/cifsproto.h:734:19: error: invalid use of undefined type 'struct cifs_open_info_data'
     734 |         kfree(data->symlink_target);
         |                   ^~
   fs/smb/client/cifsproto.h:735:26: error: invalid use of undefined type 'struct cifs_open_info_data'
     735 |         free_rsp_buf(data->reparse.io.buftype, data->reparse.io.iov.iov_base);
         |                          ^~
   fs/smb/client/cifsproto.h:735:52: error: invalid use of undefined type 'struct cifs_open_info_data'
     735 |         free_rsp_buf(data->reparse.io.buftype, data->reparse.io.iov.iov_base);
         |                                                    ^~
   fs/smb/client/cifsproto.h:736:31: error: invalid application of 'sizeof' to incomplete type 'struct cifs_open_info_data'
     736 |         memset(data, 0, sizeof(*data));
         |                               ^
..


vim +/cifs_inval_name_dfs_link_error +675 fs/smb/client/cifsproto.h

e4af35fa55b0721 fs/cifs/cifsproto.h Paulo Alcantara   2020-05-19  673  
b9ee2e307c6b063 fs/cifs/cifsproto.h Paulo Alcantara   2023-02-28  674  #else
b9ee2e307c6b063 fs/cifs/cifsproto.h Paulo Alcantara   2023-02-28 @675  static inline int cifs_inval_name_dfs_link_error(const unsigned int xid,
a2809d0e16963fd fs/cifs/cifsproto.h Eugene Korenevsky 2022-01-14  676  				   struct cifs_tcon *tcon,
a2809d0e16963fd fs/cifs/cifsproto.h Eugene Korenevsky 2022-01-14  677  				   struct cifs_sb_info *cifs_sb,
b9ee2e307c6b063 fs/cifs/cifsproto.h Paulo Alcantara   2023-02-28  678  				   const char *full_path,
b9ee2e307c6b063 fs/cifs/cifsproto.h Paulo Alcantara   2023-02-28  679  				   bool *islink)
b9ee2e307c6b063 fs/cifs/cifsproto.h Paulo Alcantara   2023-02-28  680  {
b9ee2e307c6b063 fs/cifs/cifsproto.h Paulo Alcantara   2023-02-28  681  	*islink = false;
b9ee2e307c6b063 fs/cifs/cifsproto.h Paulo Alcantara   2023-02-28  682  	return 0;
b9ee2e307c6b063 fs/cifs/cifsproto.h Paulo Alcantara   2023-02-28  683  }
1c780228e9d47b9 fs/cifs/cifsproto.h Paulo Alcantara   2018-11-14  684  #endif
1c780228e9d47b9 fs/cifs/cifsproto.h Paulo Alcantara   2018-11-14  685  
0f060936e490c62 fs/cifs/cifsproto.h Amir Goldstein    2020-02-03  686  static inline int cifs_create_options(struct cifs_sb_info *cifs_sb, int options)
0f060936e490c62 fs/cifs/cifsproto.h Amir Goldstein    2020-02-03  687  {
87f93d82e0952da fs/cifs/cifsproto.h Steve French      2020-02-04  688  	if (cifs_sb && (backup_cred(cifs_sb)))
0f060936e490c62 fs/cifs/cifsproto.h Amir Goldstein    2020-02-03  689  		return options | CREATE_OPEN_BACKUP_INTENT;
0f060936e490c62 fs/cifs/cifsproto.h Amir Goldstein    2020-02-03  690  	else
0f060936e490c62 fs/cifs/cifsproto.h Amir Goldstein    2020-02-03  691  		return options;
0f060936e490c62 fs/cifs/cifsproto.h Amir Goldstein    2020-02-03  692  }
0f060936e490c62 fs/cifs/cifsproto.h Amir Goldstein    2020-02-03  693  
8e3554150d6c80a fs/cifs/cifsproto.h Paulo Alcantara   2023-04-23  694  static inline void cifs_put_smb_ses(struct cifs_ses *ses)
8e3554150d6c80a fs/cifs/cifsproto.h Paulo Alcantara   2023-04-23  695  {
8e3554150d6c80a fs/cifs/cifsproto.h Paulo Alcantara   2023-04-23 @696  	__cifs_put_smb_ses(ses);
8e3554150d6c80a fs/cifs/cifsproto.h Paulo Alcantara   2023-04-23  697  }
8e3554150d6c80a fs/cifs/cifsproto.h Paulo Alcantara   2023-04-23  698  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
