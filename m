Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3D9156F3F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729676628; cv=none; b=TNb29nkptlk6OAugI7qbIhUvJt7jVKpSM21NZazkDhPlUTKc/HCu6mXWyQ6X0lbrBg+dt/OvrFSLGDX/DmPk63EUB78fSCGwlkw+3newy9YC29UtFtGNPKjPAEcnthPuLH9RVfjE8VDRrR2xSZd13N2Wwkw9jUV7ZhLW6zsYSHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729676628; c=relaxed/simple;
	bh=1fqhEqyOpHLCe24j3LS8kDQp7IykeTdRQBak+xtmqhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2IXDuDw5dwaI2eYouuJ3BZMBHqNV8HUE6nX0+DNqAisG/y77DsgusvMbE0Oly0aZEvq+j/s/5BVCLnelfNJZAzcTmTt3R1Rvt2IhWsuCB4uSn2ZkTvrdTaiZbCrrYpUVlCICw2YjwNdoPE4ncnAMFX3qU2qoz60LpzPrDeiGik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkHkyRt/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkHkyRt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729676626; x=1761212626;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1fqhEqyOpHLCe24j3LS8kDQp7IykeTdRQBak+xtmqhs=;
  b=mkHkyRt/GDpDgnxT2HPgjs7G5T5kl+hL+axIQKg1NtqcObfqG333DIVW
   5IKbkwifjK2a68zUyVhRnpovzQMMoYYKne9LYR0PF4OT0LdIRvouV03J2
   ogIyDg1ZII1sTIYsEmRGqmaoFXlN2TlgAxxvcQwDx7ZcX+Tymnq14PtST
   YRH/lDRFhCDjTuYr+X7Rb5RhTqCI7o4NxxuYbVeBpcE5orXvO63UZXpdd
   DHAOt2TsTv+rcZG0Ag/qZxAAccBKYmgIcAdLIs96aLYBC6V47GEiWSiZU
   9ZrBg7k7gTKKME4IpvrqTjmzt/hrafwJrzng3lbi76AeMMoPNx71BDG/m
   g==;
X-CSE-ConnectionGUID: gda/WvxgTNyUdAcSJbPE2Q==
X-CSE-MsgGUID: PkJVi8ovSGScjcJIwY83Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39868869"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="39868869"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 02:43:45 -0700
X-CSE-ConnectionGUID: 4H6m2++RQkeTeZoISaf/iA==
X-CSE-MsgGUID: wKhXhpzHSCKa3cVfVJTjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="117621209"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2024 02:43:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Xu1-000Ul2-0r;
	Wed, 23 Oct 2024 09:43:41 +0000
Date: Wed, 23 Oct 2024 17:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linux-next:master 6325/6433] security/lsm_audit.c:356:undefined
 reference to `lockdown_reasons'
Message-ID: <202410231710.JZfAVMt3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Mickaël,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ceab669fdf7b7510b4e4997b33d6f66e433a96db
commit: 762ebdee0cea1245e19ceb3d40e877532475b7b0 [6325/6433] lsm: Only build lsm_audit.c if CONFIG_AUDIT is set
config: sh-magicpanelr2_defconfig (https://download.01.org/0day-ci/archive/20241023/202410231710.JZfAVMt3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231710.JZfAVMt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231710.JZfAVMt3-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: security/lsm_audit.o: in function `dump_common_audit_data':
>> security/lsm_audit.c:356:(.text+0x4e8): undefined reference to `lockdown_reasons'


vim +356 security/lsm_audit.c

6e837fb152410e Etienne Basset     2009-04-08  190  
6e837fb152410e Etienne Basset     2009-04-08  191  /**
6e837fb152410e Etienne Basset     2009-04-08  192   * dump_common_audit_data - helper to dump common audit data
610b17b05c5c68 Bo Liu             2022-10-25  193   * @ab : the audit buffer
6e837fb152410e Etienne Basset     2009-04-08  194   * @a : common audit data
6e837fb152410e Etienne Basset     2009-04-08  195   *
6e837fb152410e Etienne Basset     2009-04-08  196   */
6e837fb152410e Etienne Basset     2009-04-08  197  static void dump_common_audit_data(struct audit_buffer *ab,
6e837fb152410e Etienne Basset     2009-04-08  198  				   struct common_audit_data *a)
6e837fb152410e Etienne Basset     2009-04-08  199  {
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  200  	char comm[sizeof(current->comm)];
6e837fb152410e Etienne Basset     2009-04-08  201  
07f62eb66c6626 Eric Paris         2012-04-04  202  	/*
4432b507445acf Paul Moore         2023-05-24  203  	 * To keep stack sizes in check force programmers to notice if they
07f62eb66c6626 Eric Paris         2012-04-04  204  	 * start making this union too large!  See struct lsm_network_audit
07f62eb66c6626 Eric Paris         2012-04-04  205  	 * as an example of how to deal with large data.
07f62eb66c6626 Eric Paris         2012-04-04  206  	 */
07f62eb66c6626 Eric Paris         2012-04-04  207  	BUILD_BUG_ON(sizeof(a->u) > sizeof(void *)*2);
07f62eb66c6626 Eric Paris         2012-04-04  208  
fa2bea2f5cca5b Paul Moore         2016-08-30  209  	audit_log_format(ab, " pid=%d comm=", task_tgid_nr(current));
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  210  	audit_log_untrustedstring(ab, memcpy(comm, current->comm, sizeof(comm)));
6e837fb152410e Etienne Basset     2009-04-08  211  
6e837fb152410e Etienne Basset     2009-04-08  212  	switch (a->type) {
cb84aa9b42b506 Eric Paris         2010-04-27  213  	case LSM_AUDIT_DATA_NONE:
2bf49690325b62 Thomas Liu         2009-07-14  214  		return;
6e837fb152410e Etienne Basset     2009-04-08  215  	case LSM_AUDIT_DATA_IPC:
8e71168e2cc760 Ondrej Mosnacek    2021-09-14  216  		audit_log_format(ab, " ipc_key=%d ", a->u.ipc_id);
6e837fb152410e Etienne Basset     2009-04-08  217  		break;
6e837fb152410e Etienne Basset     2009-04-08  218  	case LSM_AUDIT_DATA_CAP:
6e837fb152410e Etienne Basset     2009-04-08  219  		audit_log_format(ab, " capability=%d ", a->u.cap);
6e837fb152410e Etienne Basset     2009-04-08  220  		break;
f48b7399840b45 Eric Paris         2011-04-25  221  	case LSM_AUDIT_DATA_PATH: {
f48b7399840b45 Eric Paris         2011-04-25  222  		struct inode *inode;
f48b7399840b45 Eric Paris         2011-04-25  223  
f48b7399840b45 Eric Paris         2011-04-25  224  		audit_log_d_path(ab, " path=", &a->u.path);
a269434d2fb48a Eric Paris         2011-04-25  225  
c6f493d631c4d4 David Howells      2015-03-17  226  		inode = d_backing_inode(a->u.path.dentry);
41fdc3054e23e3 Kees Cook          2012-01-07  227  		if (inode) {
41fdc3054e23e3 Kees Cook          2012-01-07  228  			audit_log_format(ab, " dev=");
41fdc3054e23e3 Kees Cook          2012-01-07  229  			audit_log_untrustedstring(ab, inode->i_sb->s_id);
41fdc3054e23e3 Kees Cook          2012-01-07  230  			audit_log_format(ab, " ino=%lu", inode->i_ino);
41fdc3054e23e3 Kees Cook          2012-01-07  231  		}
a269434d2fb48a Eric Paris         2011-04-25  232  		break;
6e837fb152410e Etienne Basset     2009-04-08  233  	}
43af5de74288a7 Vivek Goyal        2016-09-09  234  	case LSM_AUDIT_DATA_FILE: {
43af5de74288a7 Vivek Goyal        2016-09-09  235  		struct inode *inode;
43af5de74288a7 Vivek Goyal        2016-09-09  236  
43af5de74288a7 Vivek Goyal        2016-09-09  237  		audit_log_d_path(ab, " path=", &a->u.file->f_path);
43af5de74288a7 Vivek Goyal        2016-09-09  238  
43af5de74288a7 Vivek Goyal        2016-09-09  239  		inode = file_inode(a->u.file);
43af5de74288a7 Vivek Goyal        2016-09-09  240  		if (inode) {
43af5de74288a7 Vivek Goyal        2016-09-09  241  			audit_log_format(ab, " dev=");
43af5de74288a7 Vivek Goyal        2016-09-09  242  			audit_log_untrustedstring(ab, inode->i_sb->s_id);
43af5de74288a7 Vivek Goyal        2016-09-09  243  			audit_log_format(ab, " ino=%lu", inode->i_ino);
43af5de74288a7 Vivek Goyal        2016-09-09  244  		}
43af5de74288a7 Vivek Goyal        2016-09-09  245  		break;
43af5de74288a7 Vivek Goyal        2016-09-09  246  	}
671a2781ff01ab Jeff Vander Stoep  2015-07-10  247  	case LSM_AUDIT_DATA_IOCTL_OP: {
671a2781ff01ab Jeff Vander Stoep  2015-07-10  248  		struct inode *inode;
671a2781ff01ab Jeff Vander Stoep  2015-07-10  249  
671a2781ff01ab Jeff Vander Stoep  2015-07-10  250  		audit_log_d_path(ab, " path=", &a->u.op->path);
671a2781ff01ab Jeff Vander Stoep  2015-07-10  251  
671a2781ff01ab Jeff Vander Stoep  2015-07-10  252  		inode = a->u.op->path.dentry->d_inode;
671a2781ff01ab Jeff Vander Stoep  2015-07-10  253  		if (inode) {
671a2781ff01ab Jeff Vander Stoep  2015-07-10  254  			audit_log_format(ab, " dev=");
671a2781ff01ab Jeff Vander Stoep  2015-07-10  255  			audit_log_untrustedstring(ab, inode->i_sb->s_id);
671a2781ff01ab Jeff Vander Stoep  2015-07-10  256  			audit_log_format(ab, " ino=%lu", inode->i_ino);
671a2781ff01ab Jeff Vander Stoep  2015-07-10  257  		}
671a2781ff01ab Jeff Vander Stoep  2015-07-10  258  
8b31f456c72e53 William Roberts    2016-08-08  259  		audit_log_format(ab, " ioctlcmd=0x%hx", a->u.op->cmd);
671a2781ff01ab Jeff Vander Stoep  2015-07-10  260  		break;
671a2781ff01ab Jeff Vander Stoep  2015-07-10  261  	}
a269434d2fb48a Eric Paris         2011-04-25  262  	case LSM_AUDIT_DATA_DENTRY: {
a269434d2fb48a Eric Paris         2011-04-25  263  		struct inode *inode;
a269434d2fb48a Eric Paris         2011-04-25  264  
a269434d2fb48a Eric Paris         2011-04-25  265  		audit_log_format(ab, " name=");
d36a1dd9f77ae1 Al Viro            2021-01-05  266  		spin_lock(&a->u.dentry->d_lock);
a269434d2fb48a Eric Paris         2011-04-25  267  		audit_log_untrustedstring(ab, a->u.dentry->d_name.name);
d36a1dd9f77ae1 Al Viro            2021-01-05  268  		spin_unlock(&a->u.dentry->d_lock);
a269434d2fb48a Eric Paris         2011-04-25  269  
c6f493d631c4d4 David Howells      2015-03-17  270  		inode = d_backing_inode(a->u.dentry);
41fdc3054e23e3 Kees Cook          2012-01-07  271  		if (inode) {
41fdc3054e23e3 Kees Cook          2012-01-07  272  			audit_log_format(ab, " dev=");
41fdc3054e23e3 Kees Cook          2012-01-07  273  			audit_log_untrustedstring(ab, inode->i_sb->s_id);
41fdc3054e23e3 Kees Cook          2012-01-07  274  			audit_log_format(ab, " ino=%lu", inode->i_ino);
41fdc3054e23e3 Kees Cook          2012-01-07  275  		}
f48b7399840b45 Eric Paris         2011-04-25  276  		break;
f48b7399840b45 Eric Paris         2011-04-25  277  	}
f48b7399840b45 Eric Paris         2011-04-25  278  	case LSM_AUDIT_DATA_INODE: {
6e837fb152410e Etienne Basset     2009-04-08  279  		struct dentry *dentry;
f48b7399840b45 Eric Paris         2011-04-25  280  		struct inode *inode;
f48b7399840b45 Eric Paris         2011-04-25  281  
23d8f5b684fc30 Al Viro            2021-01-05  282  		rcu_read_lock();
f48b7399840b45 Eric Paris         2011-04-25  283  		inode = a->u.inode;
23d8f5b684fc30 Al Viro            2021-01-05  284  		dentry = d_find_alias_rcu(inode);
6e837fb152410e Etienne Basset     2009-04-08  285  		if (dentry) {
6e837fb152410e Etienne Basset     2009-04-08  286  			audit_log_format(ab, " name=");
d36a1dd9f77ae1 Al Viro            2021-01-05  287  			spin_lock(&dentry->d_lock);
d36a1dd9f77ae1 Al Viro            2021-01-05  288  			audit_log_untrustedstring(ab, dentry->d_name.name);
d36a1dd9f77ae1 Al Viro            2021-01-05  289  			spin_unlock(&dentry->d_lock);
6e837fb152410e Etienne Basset     2009-04-08  290  		}
41fdc3054e23e3 Kees Cook          2012-01-07  291  		audit_log_format(ab, " dev=");
41fdc3054e23e3 Kees Cook          2012-01-07  292  		audit_log_untrustedstring(ab, inode->i_sb->s_id);
41fdc3054e23e3 Kees Cook          2012-01-07  293  		audit_log_format(ab, " ino=%lu", inode->i_ino);
23d8f5b684fc30 Al Viro            2021-01-05  294  		rcu_read_unlock();
6e837fb152410e Etienne Basset     2009-04-08  295  		break;
f48b7399840b45 Eric Paris         2011-04-25  296  	}
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  297  	case LSM_AUDIT_DATA_TASK: {
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  298  		struct task_struct *tsk = a->u.tsk;
f1dc4867ff41b7 Richard Guy Briggs 2013-12-11  299  		if (tsk) {
fa2bea2f5cca5b Paul Moore         2016-08-30  300  			pid_t pid = task_tgid_nr(tsk);
f1dc4867ff41b7 Richard Guy Briggs 2013-12-11  301  			if (pid) {
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  302  				char comm[sizeof(tsk->comm)];
5c5bc97e2fc819 Richard Guy Briggs 2015-04-15  303  				audit_log_format(ab, " opid=%d ocomm=", pid);
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  304  				audit_log_untrustedstring(ab,
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  305  				    memcpy(comm, tsk->comm, sizeof(comm)));
6e837fb152410e Etienne Basset     2009-04-08  306  			}
f1dc4867ff41b7 Richard Guy Briggs 2013-12-11  307  		}
6e837fb152410e Etienne Basset     2009-04-08  308  		break;
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  309  	}
6e837fb152410e Etienne Basset     2009-04-08  310  	case LSM_AUDIT_DATA_NET:
48c62af68a403e Eric Paris         2012-04-02  311  		if (a->u.net->sk) {
41dd9596d6b239 Florian Westphal   2020-11-30  312  			const struct sock *sk = a->u.net->sk;
b064ba9c3cfaf3 Eric Dumazet       2023-03-17  313  			const struct unix_sock *u;
ae3b564179bfd0 Al Viro            2019-02-15  314  			struct unix_address *addr;
6e837fb152410e Etienne Basset     2009-04-08  315  			int len = 0;
6e837fb152410e Etienne Basset     2009-04-08  316  			char *p = NULL;
6e837fb152410e Etienne Basset     2009-04-08  317  
6e837fb152410e Etienne Basset     2009-04-08  318  			switch (sk->sk_family) {
6e837fb152410e Etienne Basset     2009-04-08  319  			case AF_INET: {
abc17a11ed29b0 Eric Dumazet       2023-03-16  320  				const struct inet_sock *inet = inet_sk(sk);
6e837fb152410e Etienne Basset     2009-04-08  321  
c720c7e8383aff Eric Dumazet       2009-10-15  322  				print_ipv4_addr(ab, inet->inet_rcv_saddr,
c720c7e8383aff Eric Dumazet       2009-10-15  323  						inet->inet_sport,
6e837fb152410e Etienne Basset     2009-04-08  324  						"laddr", "lport");
c720c7e8383aff Eric Dumazet       2009-10-15  325  				print_ipv4_addr(ab, inet->inet_daddr,
c720c7e8383aff Eric Dumazet       2009-10-15  326  						inet->inet_dport,
6e837fb152410e Etienne Basset     2009-04-08  327  						"faddr", "fport");
6e837fb152410e Etienne Basset     2009-04-08  328  				break;
6e837fb152410e Etienne Basset     2009-04-08  329  			}
c2bb06db59eaf9 Eric Dumazet       2013-10-09  330  #if IS_ENABLED(CONFIG_IPV6)
6e837fb152410e Etienne Basset     2009-04-08  331  			case AF_INET6: {
abc17a11ed29b0 Eric Dumazet       2023-03-16  332  				const struct inet_sock *inet = inet_sk(sk);
6e837fb152410e Etienne Basset     2009-04-08  333  
efe4208f47f907 Eric Dumazet       2013-10-03  334  				print_ipv6_addr(ab, &sk->sk_v6_rcv_saddr,
c720c7e8383aff Eric Dumazet       2009-10-15  335  						inet->inet_sport,
6e837fb152410e Etienne Basset     2009-04-08  336  						"laddr", "lport");
efe4208f47f907 Eric Dumazet       2013-10-03  337  				print_ipv6_addr(ab, &sk->sk_v6_daddr,
c720c7e8383aff Eric Dumazet       2009-10-15  338  						inet->inet_dport,
6e837fb152410e Etienne Basset     2009-04-08  339  						"faddr", "fport");
6e837fb152410e Etienne Basset     2009-04-08  340  				break;
6e837fb152410e Etienne Basset     2009-04-08  341  			}
c2bb06db59eaf9 Eric Dumazet       2013-10-09  342  #endif
6e837fb152410e Etienne Basset     2009-04-08  343  			case AF_UNIX:
6e837fb152410e Etienne Basset     2009-04-08  344  				u = unix_sk(sk);
ae3b564179bfd0 Al Viro            2019-02-15  345  				addr = smp_load_acquire(&u->addr);
ae3b564179bfd0 Al Viro            2019-02-15  346  				if (!addr)
ae3b564179bfd0 Al Viro            2019-02-15  347  					break;
40ffe67d2e89c7 Al Viro            2012-03-14  348  				if (u->path.dentry) {
40ffe67d2e89c7 Al Viro            2012-03-14  349  					audit_log_d_path(ab, " path=", &u->path);
6e837fb152410e Etienne Basset     2009-04-08  350  					break;
6e837fb152410e Etienne Basset     2009-04-08  351  				}
ae3b564179bfd0 Al Viro            2019-02-15  352  				len = addr->len-sizeof(short);
ae3b564179bfd0 Al Viro            2019-02-15  353  				p = &addr->name->sun_path[0];
6e837fb152410e Etienne Basset     2009-04-08  354  				audit_log_format(ab, " path=");
6e837fb152410e Etienne Basset     2009-04-08  355  				if (*p)
6e837fb152410e Etienne Basset     2009-04-08 @356  					audit_log_untrustedstring(ab, p);
6e837fb152410e Etienne Basset     2009-04-08  357  				else
6e837fb152410e Etienne Basset     2009-04-08  358  					audit_log_n_hex(ab, p, len);
6e837fb152410e Etienne Basset     2009-04-08  359  				break;
6e837fb152410e Etienne Basset     2009-04-08  360  			}
6e837fb152410e Etienne Basset     2009-04-08  361  		}
6e837fb152410e Etienne Basset     2009-04-08  362  
48c62af68a403e Eric Paris         2012-04-02  363  		switch (a->u.net->family) {
6e837fb152410e Etienne Basset     2009-04-08  364  		case AF_INET:
48c62af68a403e Eric Paris         2012-04-02  365  			print_ipv4_addr(ab, a->u.net->v4info.saddr,
48c62af68a403e Eric Paris         2012-04-02  366  					a->u.net->sport,
6e837fb152410e Etienne Basset     2009-04-08  367  					"saddr", "src");
48c62af68a403e Eric Paris         2012-04-02  368  			print_ipv4_addr(ab, a->u.net->v4info.daddr,
48c62af68a403e Eric Paris         2012-04-02  369  					a->u.net->dport,
6e837fb152410e Etienne Basset     2009-04-08  370  					"daddr", "dest");
6e837fb152410e Etienne Basset     2009-04-08  371  			break;
6e837fb152410e Etienne Basset     2009-04-08  372  		case AF_INET6:
48c62af68a403e Eric Paris         2012-04-02  373  			print_ipv6_addr(ab, &a->u.net->v6info.saddr,
48c62af68a403e Eric Paris         2012-04-02  374  					a->u.net->sport,
6e837fb152410e Etienne Basset     2009-04-08  375  					"saddr", "src");
48c62af68a403e Eric Paris         2012-04-02  376  			print_ipv6_addr(ab, &a->u.net->v6info.daddr,
48c62af68a403e Eric Paris         2012-04-02  377  					a->u.net->dport,
6e837fb152410e Etienne Basset     2009-04-08  378  					"daddr", "dest");
6e837fb152410e Etienne Basset     2009-04-08  379  			break;
6e837fb152410e Etienne Basset     2009-04-08  380  		}
48c62af68a403e Eric Paris         2012-04-02  381  		if (a->u.net->netif > 0) {
6e837fb152410e Etienne Basset     2009-04-08  382  			struct net_device *dev;
6e837fb152410e Etienne Basset     2009-04-08  383  
6e837fb152410e Etienne Basset     2009-04-08  384  			/* NOTE: we always use init's namespace */
48c62af68a403e Eric Paris         2012-04-02  385  			dev = dev_get_by_index(&init_net, a->u.net->netif);
6e837fb152410e Etienne Basset     2009-04-08  386  			if (dev) {
6e837fb152410e Etienne Basset     2009-04-08  387  				audit_log_format(ab, " netif=%s", dev->name);
6e837fb152410e Etienne Basset     2009-04-08  388  				dev_put(dev);
6e837fb152410e Etienne Basset     2009-04-08  389  			}
6e837fb152410e Etienne Basset     2009-04-08  390  		}
6e837fb152410e Etienne Basset     2009-04-08  391  		break;
6e837fb152410e Etienne Basset     2009-04-08  392  #ifdef CONFIG_KEYS
6e837fb152410e Etienne Basset     2009-04-08  393  	case LSM_AUDIT_DATA_KEY:
6e837fb152410e Etienne Basset     2009-04-08  394  		audit_log_format(ab, " key_serial=%u", a->u.key_struct.key);
6e837fb152410e Etienne Basset     2009-04-08  395  		if (a->u.key_struct.key_desc) {
6e837fb152410e Etienne Basset     2009-04-08  396  			audit_log_format(ab, " key_desc=");
6e837fb152410e Etienne Basset     2009-04-08  397  			audit_log_untrustedstring(ab, a->u.key_struct.key_desc);
6e837fb152410e Etienne Basset     2009-04-08  398  		}
6e837fb152410e Etienne Basset     2009-04-08  399  		break;
6e837fb152410e Etienne Basset     2009-04-08  400  #endif
dd8dbf2e6880e3 Eric Paris         2009-11-03  401  	case LSM_AUDIT_DATA_KMOD:
dd8dbf2e6880e3 Eric Paris         2009-11-03  402  		audit_log_format(ab, " kmod=");
dd8dbf2e6880e3 Eric Paris         2009-11-03  403  		audit_log_untrustedstring(ab, a->u.kmod_name);
dd8dbf2e6880e3 Eric Paris         2009-11-03  404  		break;
cfc4d882d41780 Daniel Jurgens     2017-05-19  405  	case LSM_AUDIT_DATA_IBPKEY: {
cfc4d882d41780 Daniel Jurgens     2017-05-19  406  		struct in6_addr sbn_pfx;
cfc4d882d41780 Daniel Jurgens     2017-05-19  407  
cfc4d882d41780 Daniel Jurgens     2017-05-19  408  		memset(&sbn_pfx.s6_addr, 0,
cfc4d882d41780 Daniel Jurgens     2017-05-19  409  		       sizeof(sbn_pfx.s6_addr));
cfc4d882d41780 Daniel Jurgens     2017-05-19  410  		memcpy(&sbn_pfx.s6_addr, &a->u.ibpkey->subnet_prefix,
cfc4d882d41780 Daniel Jurgens     2017-05-19  411  		       sizeof(a->u.ibpkey->subnet_prefix));
cfc4d882d41780 Daniel Jurgens     2017-05-19  412  		audit_log_format(ab, " pkey=0x%x subnet_prefix=%pI6c",
cfc4d882d41780 Daniel Jurgens     2017-05-19  413  				 a->u.ibpkey->pkey, &sbn_pfx);
cfc4d882d41780 Daniel Jurgens     2017-05-19  414  		break;
cfc4d882d41780 Daniel Jurgens     2017-05-19  415  	}
ab861dfca1652a Daniel Jurgens     2017-05-19  416  	case LSM_AUDIT_DATA_IBENDPORT:
ab861dfca1652a Daniel Jurgens     2017-05-19  417  		audit_log_format(ab, " device=%s port_num=%u",
ab861dfca1652a Daniel Jurgens     2017-05-19  418  				 a->u.ibendport->dev_name,
ab861dfca1652a Daniel Jurgens     2017-05-19  419  				 a->u.ibendport->port);
ab861dfca1652a Daniel Jurgens     2017-05-19  420  		break;
59438b46471ae6 Stephen Smalley    2019-11-27  421  	case LSM_AUDIT_DATA_LOCKDOWN:
f1d9b23cabc61e Richard Guy Briggs 2020-07-13  422  		audit_log_format(ab, " lockdown_reason=\"%s\"",
f1d9b23cabc61e Richard Guy Briggs 2020-07-13  423  				 lockdown_reasons[a->u.reason]);
59438b46471ae6 Stephen Smalley    2019-11-27  424  		break;
c29722fad4aabb Christian Göttsche 2022-03-08  425  	case LSM_AUDIT_DATA_ANONINODE:
c29722fad4aabb Christian Göttsche 2022-03-08  426  		audit_log_format(ab, " anonclass=%s", a->u.anonclass);
c29722fad4aabb Christian Göttsche 2022-03-08  427  		break;
6e837fb152410e Etienne Basset     2009-04-08  428  	} /* switch (a->type) */
6e837fb152410e Etienne Basset     2009-04-08  429  }
6e837fb152410e Etienne Basset     2009-04-08  430  

:::::: The code at line 356 was first introduced by commit
:::::: 6e837fb152410e571a81aaadbd9884f0bc46a55e smack: implement logging V3

:::::: TO: Etienne Basset <etienne.basset@numericable.fr>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
