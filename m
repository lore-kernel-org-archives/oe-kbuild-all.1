Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894D9130AE7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715124660; cv=none; b=J74iknXlz0nUc6Uy6rrcigwOlY/aHdjCpOsNAl36/C2jf4ARKZrZALRHvyss7j1u2JagUeh1+cGz2t08PFAL2h2OR8vHLkP1ygjQac5ItCkGMCPei6t4PWC56WDTH4sCF9p8981gYkEiu30ge0elzvyef8SnQJJ/Qxlv0AXKHqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715124660; c=relaxed/simple;
	bh=oDRUd8zDcLWZLU+TVs2TmVtjmJz+FzaoaqFzn31E2pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TUroi2Rw5etmXbf/HlqNmB1212t9s2ssnPUibe251bJhMukjQMd3SAOWYbOhnISCElM6NBo+pFQot/6QJrzyUuOAIj0+eV1tNXnwE8l67QAD4fxtbryVpZTrqUnrH6KBkKahUQEntPAUsglmRSm1so4hw9HDKIM2AhCLcewX0QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VczAMBnM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VczAMBnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715124657; x=1746660657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDRUd8zDcLWZLU+TVs2TmVtjmJz+FzaoaqFzn31E2pc=;
  b=VczAMBnMK9exoJCneczjCX3IU/poch6FDXeLVYGyvXThHkE6VvpVjEau
   9Dv2+enGFWWIlBefMbJEqUemdKho2R6TeK68JXiu1rNcSgv+gol1I9aHY
   4jLXDDS9MeDVLqV49PIypAtU1MaCllYiYLjtCsevnSU7kwwtOiwHp72t3
   mCBDYcpF61ArKR7Vvn8IuAloErgLlpMzkZOpH2mN8ewwWmnu1WDtsi9g2
   ww8OTWGTbGuh6TmsYfWq3L94oBWoVYa/s9G4Os8nuG+eMPtWQTr8x8OtN
   rmkQAWTmbL+xej/vHDIdRGOZBf67IZiJuMgIAZ0CDvm/G8L5Sg0TR67cc
   Q==;
X-CSE-ConnectionGUID: dX2N/tTMRBi41VXlDQO1tw==
X-CSE-MsgGUID: cJdbFdFJRi+sBUQy3v+BDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11079298"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="11079298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 16:30:57 -0700
X-CSE-ConnectionGUID: WGCsj3W1TXS2NO39DdavnA==
X-CSE-MsgGUID: ROPk0AJMTwGP/eg2lYSHlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="33383553"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2024 16:30:56 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4UGq-0002k0-2o;
	Tue, 07 May 2024 23:30:52 +0000
Date: Wed, 8 May 2024 07:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: kpsingh <kpsingh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kpsingh:static_calls_type_1 6/6] security/security.c:5619:6:
 warning: 'security_bpf_token_free' defined but not used
Message-ID: <202405080742.2FpBcIx4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kpsingh/linux.git static_calls_type_1
head:   dafa5a9ade0b77e70e942cb20ac68c41da19916b
commit: dafa5a9ade0b77e70e942cb20ac68c41da19916b [6/6] failed delta
config: i386-randconfig-001-20240508 (https://download.01.org/0day-ci/archive/20240508/202405080742.2FpBcIx4-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080742.2FpBcIx4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080742.2FpBcIx4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/security.c:4985:5: note: previous definition of 'security_sctp_assoc_request' with type 'int(struct sctp_association *, struct sk_buff *)'
    4985 | int security_sctp_assoc_request(struct sctp_association *asoc,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5011:15: error: non-static declaration of 'security_sctp_bind_connect' follows static declaration
    5011 | EXPORT_SYMBOL(security_sctp_bind_connect);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   security/security.c:5011:1: note: in expansion of macro 'EXPORT_SYMBOL'
    5011 | EXPORT_SYMBOL(security_sctp_bind_connect);
         | ^~~~~~~~~~~~~
   security/security.c:5006:5: note: previous definition of 'security_sctp_bind_connect' with type 'int(struct sock *, int,  struct sockaddr *, int)'
    5006 | int security_sctp_bind_connect(struct sock *sk, int optname,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5028:15: error: non-static declaration of 'security_sctp_sk_clone' follows static declaration
    5028 | EXPORT_SYMBOL(security_sctp_sk_clone);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   security/security.c:5028:1: note: in expansion of macro 'EXPORT_SYMBOL'
    5028 | EXPORT_SYMBOL(security_sctp_sk_clone);
         | ^~~~~~~~~~~~~
   security/security.c:5023:6: note: previous definition of 'security_sctp_sk_clone' with type 'void(struct sctp_association *, struct sock *, struct sock *)'
    5023 | void security_sctp_sk_clone(struct sctp_association *asoc, struct sock *sk,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5045:15: error: non-static declaration of 'security_sctp_assoc_established' follows static declaration
    5045 | EXPORT_SYMBOL(security_sctp_assoc_established);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   security/security.c:5045:1: note: in expansion of macro 'EXPORT_SYMBOL'
    5045 | EXPORT_SYMBOL(security_sctp_assoc_established);
         | ^~~~~~~~~~~~~
   security/security.c:5040:5: note: previous definition of 'security_sctp_assoc_established' with type 'int(struct sctp_association *, struct sk_buff *)'
    5040 | int security_sctp_assoc_established(struct sctp_association *asoc,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5638:15: error: non-static declaration of 'security_locked_down' follows static declaration
    5638 | EXPORT_SYMBOL(security_locked_down);
         |               ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   security/security.c:5638:1: note: in expansion of macro 'EXPORT_SYMBOL'
    5638 | EXPORT_SYMBOL(security_locked_down);
         | ^~~~~~~~~~~~~
   security/security.c:5634:5: note: previous definition of 'security_locked_down' with type 'int(enum lockdown_reason)'
    5634 | int security_locked_down(enum lockdown_reason what)
         |     ^~~~~~~~~~~~~~~~~~~~
   security/security.c:5703:1: error: expected declaration or statement at end of input
    5703 | }
         | ^
   security/security.c:4103:1: warning: label 'out' defined but not used [-Wunused-label]
    4103 | out:
         | ^~~
   security/security.c:4048:13: warning: unused variable 'rc' [-Wunused-variable]
    4048 |         int rc;
         |             ^~
   security/security.c:4046:14: warning: variable 'single' set but not used [-Wunused-but-set-variable]
    4046 |         bool single = false;
         |              ^~~~~~
   security/security.c:4044:13: warning: variable 'left' set but not used [-Wunused-but-set-variable]
    4044 |         u32 left;
         |             ^~~~
   security/security.c:4042:13: warning: unused variable 'entrysize' [-Wunused-variable]
    4042 |         u32 entrysize;
         |             ^~~~~~~~~
   security/security.c:4041:20: warning: unused variable 'base' [-Wunused-variable]
    4041 |         u8 __user *base = (u8 __user *)uctx;
         |                    ^~~~
   security/security.c: At top level:
   security/security.c:5700:5: warning: 'security_perf_event_write' defined but not used [-Wunused-function]
    5700 | int security_perf_event_write(struct perf_event *event)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5687:5: warning: 'security_perf_event_read' defined but not used [-Wunused-function]
    5687 | int security_perf_event_read(struct perf_event *event)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5674:6: warning: 'security_perf_event_free' defined but not used [-Wunused-function]
    5674 | void security_perf_event_free(struct perf_event *event)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5663:5: warning: 'security_perf_event_alloc' defined but not used [-Wunused-function]
    5663 | int security_perf_event_alloc(struct perf_event *event)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5650:5: warning: 'security_perf_event_open' defined but not used [-Wunused-function]
    5650 | int security_perf_event_open(struct perf_event_attr *attr, int type)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5619:6: warning: 'security_bpf_token_free' defined but not used [-Wunused-function]
    5619 | void security_bpf_token_free(struct bpf_token *token)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5608:6: warning: 'security_bpf_prog_free' defined but not used [-Wunused-function]
    5608 | void security_bpf_prog_free(struct bpf_prog *prog)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5597:6: warning: 'security_bpf_map_free' defined but not used [-Wunused-function]
    5597 | void security_bpf_map_free(struct bpf_map *map)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5586:5: warning: 'security_bpf_token_capable' defined but not used [-Wunused-function]
    5586 | int security_bpf_token_capable(const struct bpf_token *token, int cap)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5570:5: warning: 'security_bpf_token_cmd' defined but not used [-Wunused-function]
    5570 | int security_bpf_token_cmd(const struct bpf_token *token, enum bpf_cmd cmd)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5553:5: warning: 'security_bpf_token_create' defined but not used [-Wunused-function]
    5553 | int security_bpf_token_create(struct bpf_token *token, union bpf_attr *attr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5536:5: warning: 'security_bpf_prog_load' defined but not used [-Wunused-function]
    5536 | int security_bpf_prog_load(struct bpf_prog *prog, union bpf_attr *attr,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5518:5: warning: 'security_bpf_map_create' defined but not used [-Wunused-function]
    5518 | int security_bpf_map_create(struct bpf_map *map, union bpf_attr *attr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5502:5: warning: 'security_bpf_prog' defined but not used [-Wunused-function]
    5502 | int security_bpf_prog(struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~
>> security/security.c:5488:5: warning: 'security_bpf_map' defined but not used [-Wunused-function]
    5488 | int security_bpf_map(struct bpf_map *map, fmode_t fmode)
         |     ^~~~~~~~~~~~~~~~
>> security/security.c:5473:5: warning: 'security_bpf' defined but not used [-Wunused-function]
    5473 | int security_bpf(int cmd, union bpf_attr *attr, unsigned int size)
         |     ^~~~~~~~~~~~
   security/security.c:5454:5: warning: 'security_audit_rule_match' defined but not used [-Wunused-function]
    5454 | int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5436:6: warning: 'security_audit_rule_free' defined but not used [-Wunused-function]
    5436 | void security_audit_rule_free(void *lsmrule)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5424:5: warning: 'security_audit_rule_known' defined but not used [-Wunused-function]
    5424 | int security_audit_rule_known(struct audit_krule *krule)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5410:5: warning: 'security_audit_rule_init' defined but not used [-Wunused-function]
    5410 | int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5388:6: warning: 'security_key_post_create_or_update' defined but not used [-Wunused-function]
    5388 | void security_key_post_create_or_update(struct key *keyring, struct key *key,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5371:5: warning: 'security_key_getsecurity' defined but not used [-Wunused-function]
    5371 | int security_key_getsecurity(struct key *key, char **buffer)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5352:5: warning: 'security_key_permission' defined but not used [-Wunused-function]
    5352 | int security_key_permission(key_ref_t key_ref, const struct cred *cred,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5337:6: warning: 'security_key_free' defined but not used [-Wunused-function]
    5337 | void security_key_free(struct key *key)
         |      ^~~~~~~~~~~~~~~~~
   security/security.c:5325:5: warning: 'security_key_alloc' defined but not used [-Wunused-function]
    5325 | int security_key_alloc(struct key *key, const struct cred *cred,
         |     ^~~~~~~~~~~~~~~~~~
   security/security.c:5059:5: warning: 'security_mptcp_add_subflow' defined but not used [-Wunused-function]
    5059 | int security_mptcp_add_subflow(struct sock *sk, struct sock *ssk)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4835:6: warning: 'security_inet_csk_clone' defined but not used [-Wunused-function]
    4835 | void security_inet_csk_clone(struct sock *newsk,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4752:6: warning: 'security_sk_free' defined but not used [-Wunused-function]
    4752 | void security_sk_free(struct sock *sk)
         |      ^~~~~~~~~~~~~~~~
   security/security.c:4741:5: warning: 'security_sk_alloc' defined but not used [-Wunused-function]
    4741 | int security_sk_alloc(struct sock *sk, int family, gfp_t priority)
         |     ^~~~~~~~~~~~~~~~~
   security/security.c:4702:5: warning: 'security_socket_getpeersec_stream' defined but not used [-Wunused-function]
    4702 | int security_socket_getpeersec_stream(struct socket *sock, sockptr_t optval,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4664:5: warning: 'security_socket_shutdown' defined but not used [-Wunused-function]
    4664 | int security_socket_shutdown(struct socket *sock, int how)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4649:5: warning: 'security_socket_setsockopt' defined but not used [-Wunused-function]
    4649 | int security_socket_setsockopt(struct socket *sock, int level, int optname)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4634:5: warning: 'security_socket_getsockopt' defined but not used [-Wunused-function]
    4634 | int security_socket_getsockopt(struct socket *sock, int level, int optname)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4618:5: warning: 'security_socket_getpeername' defined but not used [-Wunused-function]
    4618 | int security_socket_getpeername(struct socket *sock)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4605:5: warning: 'security_socket_getsockname' defined but not used [-Wunused-function]
    4605 | int security_socket_getsockname(struct socket *sock)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4590:5: warning: 'security_socket_recvmsg' defined but not used [-Wunused-function]
    4590 | int security_socket_recvmsg(struct socket *sock, struct msghdr *msg,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4574:5: warning: 'security_socket_sendmsg' defined but not used [-Wunused-function]
    4574 | int security_socket_sendmsg(struct socket *sock, struct msghdr *msg, int size)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4559:5: warning: 'security_socket_accept' defined but not used [-Wunused-function]
    4559 | int security_socket_accept(struct socket *sock, struct socket *newsock)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4543:5: warning: 'security_socket_listen' defined but not used [-Wunused-function]
    4543 | int security_socket_listen(struct socket *sock, int backlog)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4528:5: warning: 'security_socket_connect' defined but not used [-Wunused-function]
    4528 | int security_socket_connect(struct socket *sock,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4511:5: warning: 'security_socket_bind' defined but not used [-Wunused-function]
    4511 | int security_socket_bind(struct socket *sock,
         |     ^~~~~~~~~~~~~~~~~~~~
   security/security.c:4476:5: warning: 'security_socket_post_create' defined but not used [-Wunused-function]
    4476 | int security_socket_post_create(struct socket *sock, int family,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4453:5: warning: 'security_socket_create' defined but not used [-Wunused-function]
    4453 | int security_socket_create(int family, int type, int protocol, int kern)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4211:5: warning: 'security_netlink_send' defined but not used [-Wunused-function]
    4211 | int security_netlink_send(struct sock *sk, struct sk_buff *skb)
         |     ^~~~~~~~~~~~~~~~~~~~~
   security/security.c:4193:5: warning: 'security_setprocattr' defined but not used [-Wunused-function]
    4193 | int security_setprocattr(int lsmid, const char *name, void *value, size_t size)
         |     ^~~~~~~~~~~~~~~~~~~~
   security/security.c:4175:5: warning: 'security_getprocattr' defined but not used [-Wunused-function]
    4175 | int security_getprocattr(struct task_struct *p, int lsmid, const char *name,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/security_bpf_token_free +5619 security/security.c

afdb09c720b62b Chenbo Feng             2017-10-18  5459  
afdb09c720b62b Chenbo Feng             2017-10-18  5460  #ifdef CONFIG_BPF_SYSCALL
55e853201a9e03 Paul Moore              2023-02-16  5461  /**
55e853201a9e03 Paul Moore              2023-02-16  5462   * security_bpf() - Check if the bpf syscall operation is allowed
55e853201a9e03 Paul Moore              2023-02-16  5463   * @cmd: command
55e853201a9e03 Paul Moore              2023-02-16  5464   * @attr: bpf attribute
55e853201a9e03 Paul Moore              2023-02-16  5465   * @size: size
55e853201a9e03 Paul Moore              2023-02-16  5466   *
55e853201a9e03 Paul Moore              2023-02-16  5467   * Do a initial check for all bpf syscalls after the attribute is copied into
55e853201a9e03 Paul Moore              2023-02-16  5468   * the kernel. The actual security module can implement their own rules to
55e853201a9e03 Paul Moore              2023-02-16  5469   * check the specific cmd they need.
55e853201a9e03 Paul Moore              2023-02-16  5470   *
55e853201a9e03 Paul Moore              2023-02-16  5471   * Return: Returns 0 if permission is granted.
55e853201a9e03 Paul Moore              2023-02-16  5472   */
afdb09c720b62b Chenbo Feng             2017-10-18 @5473  int security_bpf(int cmd, union bpf_attr *attr, unsigned int size)
afdb09c720b62b Chenbo Feng             2017-10-18  5474  {
260017f31a8c38 Ondrej Mosnacek         2024-01-30  5475  	return call_int_hook(bpf, cmd, attr, size);
afdb09c720b62b Chenbo Feng             2017-10-18  5476  }
55e853201a9e03 Paul Moore              2023-02-16  5477  
55e853201a9e03 Paul Moore              2023-02-16  5478  /**
55e853201a9e03 Paul Moore              2023-02-16  5479   * security_bpf_map() - Check if access to a bpf map is allowed
55e853201a9e03 Paul Moore              2023-02-16  5480   * @map: bpf map
55e853201a9e03 Paul Moore              2023-02-16  5481   * @fmode: mode
55e853201a9e03 Paul Moore              2023-02-16  5482   *
55e853201a9e03 Paul Moore              2023-02-16  5483   * Do a check when the kernel generates and returns a file descriptor for eBPF
55e853201a9e03 Paul Moore              2023-02-16  5484   * maps.
55e853201a9e03 Paul Moore              2023-02-16  5485   *
55e853201a9e03 Paul Moore              2023-02-16  5486   * Return: Returns 0 if permission is granted.
55e853201a9e03 Paul Moore              2023-02-16  5487   */
afdb09c720b62b Chenbo Feng             2017-10-18 @5488  int security_bpf_map(struct bpf_map *map, fmode_t fmode)
afdb09c720b62b Chenbo Feng             2017-10-18  5489  {
260017f31a8c38 Ondrej Mosnacek         2024-01-30  5490  	return call_int_hook(bpf_map, map, fmode);
afdb09c720b62b Chenbo Feng             2017-10-18  5491  }
55e853201a9e03 Paul Moore              2023-02-16  5492  
55e853201a9e03 Paul Moore              2023-02-16  5493  /**
55e853201a9e03 Paul Moore              2023-02-16  5494   * security_bpf_prog() - Check if access to a bpf program is allowed
55e853201a9e03 Paul Moore              2023-02-16  5495   * @prog: bpf program
55e853201a9e03 Paul Moore              2023-02-16  5496   *
55e853201a9e03 Paul Moore              2023-02-16  5497   * Do a check when the kernel generates and returns a file descriptor for eBPF
55e853201a9e03 Paul Moore              2023-02-16  5498   * programs.
55e853201a9e03 Paul Moore              2023-02-16  5499   *
55e853201a9e03 Paul Moore              2023-02-16  5500   * Return: Returns 0 if permission is granted.
55e853201a9e03 Paul Moore              2023-02-16  5501   */
afdb09c720b62b Chenbo Feng             2017-10-18 @5502  int security_bpf_prog(struct bpf_prog *prog)
afdb09c720b62b Chenbo Feng             2017-10-18  5503  {
260017f31a8c38 Ondrej Mosnacek         2024-01-30  5504  	return call_int_hook(bpf_prog, prog);
afdb09c720b62b Chenbo Feng             2017-10-18  5505  }
55e853201a9e03 Paul Moore              2023-02-16  5506  
55e853201a9e03 Paul Moore              2023-02-16  5507  /**
a2431c7eabcf9b Andrii Nakryiko         2024-01-23  5508   * security_bpf_map_create() - Check if BPF map creation is allowed
a2431c7eabcf9b Andrii Nakryiko         2024-01-23  5509   * @map: BPF map object
a2431c7eabcf9b Andrii Nakryiko         2024-01-23  5510   * @attr: BPF syscall attributes used to create BPF map
a2431c7eabcf9b Andrii Nakryiko         2024-01-23  5511   * @token: BPF token used to grant user access
55e853201a9e03 Paul Moore              2023-02-16  5512   *
a2431c7eabcf9b Andrii Nakryiko         2024-01-23  5513   * Do a check when the kernel creates a new BPF map. This is also the
a2431c7eabcf9b Andrii Nakryiko         2024-01-23  5514   * point where LSM blob is allocated for LSMs that need them.
55e853201a9e03 Paul Moore              2023-02-16  5515   *
55e853201a9e03 Paul Moore              2023-02-16  5516   * Return: Returns 0 on success, error on failure.
55e853201a9e03 Paul Moore              2023-02-16  5517   */
a2431c7eabcf9b Andrii Nakryiko         2024-01-23 @5518  int security_bpf_map_create(struct bpf_map *map, union bpf_attr *attr,
a2431c7eabcf9b Andrii Nakryiko         2024-01-23  5519  			    struct bpf_token *token)
afdb09c720b62b Chenbo Feng             2017-10-18  5520  {
cc4a875cf3b3bc Linus Torvalds          2024-03-12  5521  	return call_int_hook(bpf_map_create, map, attr, token);
afdb09c720b62b Chenbo Feng             2017-10-18  5522  }
55e853201a9e03 Paul Moore              2023-02-16  5523  
55e853201a9e03 Paul Moore              2023-02-16  5524  /**
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5525   * security_bpf_prog_load() - Check if loading of BPF program is allowed
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5526   * @prog: BPF program object
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5527   * @attr: BPF syscall attributes used to create BPF program
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5528   * @token: BPF token used to grant user access to BPF subsystem
55e853201a9e03 Paul Moore              2023-02-16  5529   *
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5530   * Perform an access control check when the kernel loads a BPF program and
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5531   * allocates associated BPF program object. This hook is also responsible for
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5532   * allocating any required LSM state for the BPF program.
55e853201a9e03 Paul Moore              2023-02-16  5533   *
55e853201a9e03 Paul Moore              2023-02-16  5534   * Return: Returns 0 on success, error on failure.
55e853201a9e03 Paul Moore              2023-02-16  5535   */
1b67772e4e3f16 Andrii Nakryiko         2024-01-23 @5536  int security_bpf_prog_load(struct bpf_prog *prog, union bpf_attr *attr,
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5537  			   struct bpf_token *token)
afdb09c720b62b Chenbo Feng             2017-10-18  5538  {
cc4a875cf3b3bc Linus Torvalds          2024-03-12  5539  	return call_int_hook(bpf_prog_load, prog, attr, token);
afdb09c720b62b Chenbo Feng             2017-10-18  5540  }
55e853201a9e03 Paul Moore              2023-02-16  5541  
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5542  /**
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5543   * security_bpf_token_create() - Check if creating of BPF token is allowed
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5544   * @token: BPF token object
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5545   * @attr: BPF syscall attributes used to create BPF token
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5546   * @path: path pointing to BPF FS mount point from which BPF token is created
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5547   *
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5548   * Do a check when the kernel instantiates a new BPF token object from BPF FS
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5549   * instance. This is also the point where LSM blob can be allocated for LSMs.
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5550   *
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5551   * Return: Returns 0 on success, error on failure.
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5552   */
f568a3d49af9ae Andrii Nakryiko         2024-01-23 @5553  int security_bpf_token_create(struct bpf_token *token, union bpf_attr *attr,
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5554  			      struct path *path)
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5555  {
cc4a875cf3b3bc Linus Torvalds          2024-03-12  5556  	return call_int_hook(bpf_token_create, token, attr, path);
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5557  }
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5558  
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5559  /**
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5560   * security_bpf_token_cmd() - Check if BPF token is allowed to delegate
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5561   * requested BPF syscall command
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5562   * @token: BPF token object
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5563   * @cmd: BPF syscall command requested to be delegated by BPF token
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5564   *
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5565   * Do a check when the kernel decides whether provided BPF token should allow
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5566   * delegation of requested BPF syscall command.
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5567   *
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5568   * Return: Returns 0 on success, error on failure.
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5569   */
f568a3d49af9ae Andrii Nakryiko         2024-01-23 @5570  int security_bpf_token_cmd(const struct bpf_token *token, enum bpf_cmd cmd)
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5571  {
cc4a875cf3b3bc Linus Torvalds          2024-03-12  5572  	return call_int_hook(bpf_token_cmd, token, cmd);
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5573  }
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5574  
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5575  /**
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5576   * security_bpf_token_capable() - Check if BPF token is allowed to delegate
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5577   * requested BPF-related capability
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5578   * @token: BPF token object
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5579   * @cap: capabilities requested to be delegated by BPF token
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5580   *
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5581   * Do a check when the kernel decides whether provided BPF token should allow
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5582   * delegation of requested BPF-related capabilities.
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5583   *
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5584   * Return: Returns 0 on success, error on failure.
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5585   */
f568a3d49af9ae Andrii Nakryiko         2024-01-23 @5586  int security_bpf_token_capable(const struct bpf_token *token, int cap)
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5587  {
cc4a875cf3b3bc Linus Torvalds          2024-03-12  5588  	return call_int_hook(bpf_token_capable, token, cap);
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5589  }
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5590  
55e853201a9e03 Paul Moore              2023-02-16  5591  /**
55e853201a9e03 Paul Moore              2023-02-16  5592   * security_bpf_map_free() - Free a bpf map's LSM blob
55e853201a9e03 Paul Moore              2023-02-16  5593   * @map: bpf map
55e853201a9e03 Paul Moore              2023-02-16  5594   *
55e853201a9e03 Paul Moore              2023-02-16  5595   * Clean up the security information stored inside bpf map.
55e853201a9e03 Paul Moore              2023-02-16  5596   */
afdb09c720b62b Chenbo Feng             2017-10-18 @5597  void security_bpf_map_free(struct bpf_map *map)
afdb09c720b62b Chenbo Feng             2017-10-18  5598  {
a2431c7eabcf9b Andrii Nakryiko         2024-01-23  5599  	call_void_hook(bpf_map_free, map);
afdb09c720b62b Chenbo Feng             2017-10-18  5600  }
55e853201a9e03 Paul Moore              2023-02-16  5601  
55e853201a9e03 Paul Moore              2023-02-16  5602  /**
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5603   * security_bpf_prog_free() - Free a BPF program's LSM blob
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5604   * @prog: BPF program struct
55e853201a9e03 Paul Moore              2023-02-16  5605   *
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5606   * Clean up the security information stored inside BPF program.
55e853201a9e03 Paul Moore              2023-02-16  5607   */
1b67772e4e3f16 Andrii Nakryiko         2024-01-23 @5608  void security_bpf_prog_free(struct bpf_prog *prog)
afdb09c720b62b Chenbo Feng             2017-10-18  5609  {
1b67772e4e3f16 Andrii Nakryiko         2024-01-23  5610  	call_void_hook(bpf_prog_free, prog);
afdb09c720b62b Chenbo Feng             2017-10-18  5611  }
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5612  
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5613  /**
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5614   * security_bpf_token_free() - Free a BPF token's LSM blob
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5615   * @token: BPF token struct
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5616   *
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5617   * Clean up the security information stored inside BPF token.
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5618   */
f568a3d49af9ae Andrii Nakryiko         2024-01-23 @5619  void security_bpf_token_free(struct bpf_token *token)
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5620  {
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5621  	call_void_hook(bpf_token_free, token);
f568a3d49af9ae Andrii Nakryiko         2024-01-23  5622  }
afdb09c720b62b Chenbo Feng             2017-10-18  5623  #endif /* CONFIG_BPF_SYSCALL */
9e47d31d6a57b5 Matthew Garrett         2019-08-19  5624  
e261301c851aee Paul Moore              2023-02-16  5625  /**
e261301c851aee Paul Moore              2023-02-16  5626   * security_locked_down() - Check if a kernel feature is allowed
e261301c851aee Paul Moore              2023-02-16  5627   * @what: requested kernel feature
e261301c851aee Paul Moore              2023-02-16  5628   *
e261301c851aee Paul Moore              2023-02-16  5629   * Determine whether a kernel feature that potentially enables arbitrary code
e261301c851aee Paul Moore              2023-02-16  5630   * execution in kernel space should be permitted.
e261301c851aee Paul Moore              2023-02-16  5631   *
e261301c851aee Paul Moore              2023-02-16  5632   * Return: Returns 0 if permission is granted.
e261301c851aee Paul Moore              2023-02-16  5633   */
9e47d31d6a57b5 Matthew Garrett         2019-08-19  5634  int security_locked_down(enum lockdown_reason what)
9e47d31d6a57b5 Matthew Garrett         2019-08-19  5635  {
260017f31a8c38 Ondrej Mosnacek         2024-01-30  5636  	return call_int_hook(locked_down, what);
9e47d31d6a57b5 Matthew Garrett         2019-08-19  5637  }
9e47d31d6a57b5 Matthew Garrett         2019-08-19  5638  EXPORT_SYMBOL(security_locked_down);
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5639) 
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5640) #ifdef CONFIG_PERF_EVENTS
452b670c7222c7 Paul Moore              2023-02-16  5641  /**
452b670c7222c7 Paul Moore              2023-02-16  5642   * security_perf_event_open() - Check if a perf event open is allowed
452b670c7222c7 Paul Moore              2023-02-16  5643   * @attr: perf event attribute
452b670c7222c7 Paul Moore              2023-02-16  5644   * @type: type of event
452b670c7222c7 Paul Moore              2023-02-16  5645   *
452b670c7222c7 Paul Moore              2023-02-16  5646   * Check whether the @type of perf_event_open syscall is allowed.
452b670c7222c7 Paul Moore              2023-02-16  5647   *
452b670c7222c7 Paul Moore              2023-02-16  5648   * Return: Returns 0 if permission is granted.
452b670c7222c7 Paul Moore              2023-02-16  5649   */
da97e18458fb42 Joel Fernandes (Google  2019-10-14 @5650) int security_perf_event_open(struct perf_event_attr *attr, int type)
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5651) {
260017f31a8c38 Ondrej Mosnacek         2024-01-30  5652  	return call_int_hook(perf_event_open, attr, type);
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5653) }
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5654) 
452b670c7222c7 Paul Moore              2023-02-16  5655  /**
452b670c7222c7 Paul Moore              2023-02-16  5656   * security_perf_event_alloc() - Allocate a perf event LSM blob
452b670c7222c7 Paul Moore              2023-02-16  5657   * @event: perf event
452b670c7222c7 Paul Moore              2023-02-16  5658   *
452b670c7222c7 Paul Moore              2023-02-16  5659   * Allocate and save perf_event security info.
452b670c7222c7 Paul Moore              2023-02-16  5660   *
452b670c7222c7 Paul Moore              2023-02-16  5661   * Return: Returns 0 on success, error on failure.
452b670c7222c7 Paul Moore              2023-02-16  5662   */
da97e18458fb42 Joel Fernandes (Google  2019-10-14 @5663) int security_perf_event_alloc(struct perf_event *event)
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5664) {
260017f31a8c38 Ondrej Mosnacek         2024-01-30  5665  	return call_int_hook(perf_event_alloc, event);
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5666) }
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5667) 
452b670c7222c7 Paul Moore              2023-02-16  5668  /**
452b670c7222c7 Paul Moore              2023-02-16  5669   * security_perf_event_free() - Free a perf event LSM blob
452b670c7222c7 Paul Moore              2023-02-16  5670   * @event: perf event
452b670c7222c7 Paul Moore              2023-02-16  5671   *
452b670c7222c7 Paul Moore              2023-02-16  5672   * Release (free) perf_event security info.
452b670c7222c7 Paul Moore              2023-02-16  5673   */
da97e18458fb42 Joel Fernandes (Google  2019-10-14 @5674) void security_perf_event_free(struct perf_event *event)
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5675) {
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5676) 	call_void_hook(perf_event_free, event);
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5677) }
da97e18458fb42 Joel Fernandes (Google  2019-10-14  5678) 

:::::: The code at line 5619 was first introduced by commit
:::::: f568a3d49af9aed813a184353592efe29b0e3d16 bpf,lsm: Add BPF token LSM hooks

:::::: TO: Andrii Nakryiko <andrii@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
