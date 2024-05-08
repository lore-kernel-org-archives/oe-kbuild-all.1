Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0814C91
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 01:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715130428; cv=none; b=WTkfTltCCPv7T7B7IQ6CgavBGj4ZMF/5ea2mOdEMqatfgdnNZeIn5Cggl9iVDZbz9OTG5sFtZ/JVMWL7JoozUPd6MeXEn5MDxRYCH334YJjQFIEDNNbap1SQAdGMd1U+enRZU8pPDyPY/DDTjBCDnO1fox3RA7yx/GoCzBCZibA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715130428; c=relaxed/simple;
	bh=LXZ0TljACPICeiRqIfyb8k8c6P1SK2faZw93+Tc55n0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PCOXBmKJKT65Y1ChKXpTdoX7x7tZZMIm2vRBZ95/SKImSwyXnWceZYbRlwoDtKW01QfZYqKu48q8QCMhlhWJLir0WUtJzhUTkTc0bbcI1WfFX3oc4PmFQABkFGM29JJLc4H3OipD2ArGikwAjs5GKSoumXLzxVpGSuvM4Dtx23c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqtrgMbe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqtrgMbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715130427; x=1746666427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LXZ0TljACPICeiRqIfyb8k8c6P1SK2faZw93+Tc55n0=;
  b=WqtrgMbe9qPU6YYx/EubNuTLL2J7GHOK4c7ddI4QG02uR2o3Qgv8Xtk3
   MisMT5fYjtiE60AiN6HgeKTiyI5kl81JA3eyVi5j2icXXKLWDR15Bfdan
   JV7aot/YtWGomoCVLNZZgClPsBTx2eCO7MjABxUshSEAd7h5SZDtcMkrb
   TxkZQF/BgmInXyRNvCvJ0q8wsgYc4YcQ4h79WsCwPpJSsGSFUw6k2WrZr
   OIw9zi4WjYjTzRhPPqDRbnAMc/qsvpSTbAX0t056PVVoQ3DqYmChdXyJy
   tYKwwzNAmqX8hWSazyN7+GDQv4ItTt0qKdODYi0z8JRXi3PStNlCKc3xI
   A==;
X-CSE-ConnectionGUID: vOBbIYLUQHyo1OP6VER/Zw==
X-CSE-MsgGUID: dGYqnFqFQPGNsu7+CNTsig==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21523946"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="21523946"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 18:07:04 -0700
X-CSE-ConnectionGUID: qDbTN+m5S8S0be2MOBpPGg==
X-CSE-MsgGUID: c5NraobRRL6PaqtFymG7/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="28579668"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2024 18:06:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4Vln-0002nm-06;
	Wed, 08 May 2024 01:06:55 +0000
Date: Wed, 8 May 2024 09:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: kpsingh <kpsingh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kpsingh:static_calls_type_1 6/6] security/security.c:5298:5:
 warning: 'security_xfrm_decode_session' defined but not used
Message-ID: <202405080824.FsDR6dOP-lkp@intel.com>
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240508/202405080824.FsDR6dOP-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080824.FsDR6dOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080824.FsDR6dOP-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   security/security.c:5742:5: warning: 'security_uring_cmd' defined but not used [-Wunused-function]
    5742 | int security_uring_cmd(struct io_uring_cmd *ioucmd)
         |     ^~~~~~~~~~~~~~~~~~
   security/security.c:5729:5: warning: 'security_uring_sqpoll' defined but not used [-Wunused-function]
    5729 | int security_uring_sqpoll(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
   security/security.c:5716:5: warning: 'security_uring_override_creds' defined but not used [-Wunused-function]
    5716 | int security_uring_override_creds(const struct cred *new)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   security/security.c:5619:6: warning: 'security_bpf_token_free' defined but not used [-Wunused-function]
    5619 | void security_bpf_token_free(struct bpf_token *token)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5608:6: warning: 'security_bpf_prog_free' defined but not used [-Wunused-function]
    5608 | void security_bpf_prog_free(struct bpf_prog *prog)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5597:6: warning: 'security_bpf_map_free' defined but not used [-Wunused-function]
    5597 | void security_bpf_map_free(struct bpf_map *map)
         |      ^~~~~~~~~~~~~~~~~~~~~
   security/security.c:5586:5: warning: 'security_bpf_token_capable' defined but not used [-Wunused-function]
    5586 | int security_bpf_token_capable(const struct bpf_token *token, int cap)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5570:5: warning: 'security_bpf_token_cmd' defined but not used [-Wunused-function]
    5570 | int security_bpf_token_cmd(const struct bpf_token *token, enum bpf_cmd cmd)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5553:5: warning: 'security_bpf_token_create' defined but not used [-Wunused-function]
    5553 | int security_bpf_token_create(struct bpf_token *token, union bpf_attr *attr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5536:5: warning: 'security_bpf_prog_load' defined but not used [-Wunused-function]
    5536 | int security_bpf_prog_load(struct bpf_prog *prog, union bpf_attr *attr,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5518:5: warning: 'security_bpf_map_create' defined but not used [-Wunused-function]
    5518 | int security_bpf_map_create(struct bpf_map *map, union bpf_attr *attr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:5502:5: warning: 'security_bpf_prog' defined but not used [-Wunused-function]
    5502 | int security_bpf_prog(struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~
   security/security.c:5488:5: warning: 'security_bpf_map' defined but not used [-Wunused-function]
    5488 | int security_bpf_map(struct bpf_map *map, fmode_t fmode)
         |     ^~~~~~~~~~~~~~~~
   security/security.c:5473:5: warning: 'security_bpf' defined but not used [-Wunused-function]
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
>> security/security.c:5298:5: warning: 'security_xfrm_decode_session' defined but not used [-Wunused-function]
    5298 | int security_xfrm_decode_session(struct sk_buff *skb, u32 *secid)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5276:5: warning: 'security_xfrm_state_pol_flow_match' defined but not used [-Wunused-function]
    5276 | int security_xfrm_state_pol_flow_match(struct xfrm_state *x,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5261:5: warning: 'security_xfrm_policy_lookup' defined but not used [-Wunused-function]
    5261 | int security_xfrm_policy_lookup(struct xfrm_sec_ctx *ctx, u32 fl_secid)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5244:6: warning: 'security_xfrm_state_free' defined but not used [-Wunused-function]
    5244 | void security_xfrm_state_free(struct xfrm_state *x)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5218:5: warning: 'security_xfrm_state_alloc_acquire' defined but not used [-Wunused-function]
    5218 | int security_xfrm_state_alloc_acquire(struct xfrm_state *x,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5183:5: warning: 'security_xfrm_policy_delete' defined but not used [-Wunused-function]
    5183 | int security_xfrm_policy_delete(struct xfrm_sec_ctx *ctx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/security.c:5157:5: warning: 'security_xfrm_policy_clone' defined but not used [-Wunused-function]
    5157 | int security_xfrm_policy_clone(struct xfrm_sec_ctx *old_ctx,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> security/security.c:4381:5: warning: 'security_watch_key' defined but not used [-Wunused-function]
    4381 | int security_watch_key(struct key *key)
         |     ^~~~~~~~~~~~~~~~~~
>> security/security.c:4363:5: warning: 'security_post_notification' defined but not used [-Wunused-function]
    4363 | int security_post_notification(const struct cred *w_cred,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:4211:5: warning: 'security_netlink_send' defined but not used [-Wunused-function]
    4211 | int security_netlink_send(struct sock *sk, struct sk_buff *skb)
         |     ^~~~~~~~~~~~~~~~~~~~~
   security/security.c:4193:5: warning: 'security_setprocattr' defined but not used [-Wunused-function]
    4193 | int security_setprocattr(int lsmid, const char *name, void *value, size_t size)
         |     ^~~~~~~~~~~~~~~~~~~~
   security/security.c:4175:5: warning: 'security_getprocattr' defined but not used [-Wunused-function]
    4175 | int security_getprocattr(struct task_struct *p, int lsmid, const char *name,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/security_xfrm_decode_session +5298 security/security.c

20510f2f4e2dab James Morris    2007-10-16  5146  
742b99456e86aa Paul Moore      2023-02-15  5147  /**
742b99456e86aa Paul Moore      2023-02-15  5148   * security_xfrm_policy_clone() - Clone xfrm policy LSM state
742b99456e86aa Paul Moore      2023-02-15  5149   * @old_ctx: xfrm security context
742b99456e86aa Paul Moore      2023-02-15  5150   * @new_ctxp: target xfrm security context
742b99456e86aa Paul Moore      2023-02-15  5151   *
742b99456e86aa Paul Moore      2023-02-15  5152   * Allocate a security structure in new_ctxp that contains the information from
742b99456e86aa Paul Moore      2023-02-15  5153   * the old_ctx structure.
742b99456e86aa Paul Moore      2023-02-15  5154   *
742b99456e86aa Paul Moore      2023-02-15  5155   * Return: Return 0 if operation was successful.
742b99456e86aa Paul Moore      2023-02-15  5156   */
03e1ad7b5d871d Paul Moore      2008-04-12 @5157  int security_xfrm_policy_clone(struct xfrm_sec_ctx *old_ctx,
03e1ad7b5d871d Paul Moore      2008-04-12  5158  			       struct xfrm_sec_ctx **new_ctxp)
20510f2f4e2dab James Morris    2007-10-16  5159  {
260017f31a8c38 Ondrej Mosnacek 2024-01-30  5160  	return call_int_hook(xfrm_policy_clone_security, old_ctx, new_ctxp);
20510f2f4e2dab James Morris    2007-10-16  5161  }
20510f2f4e2dab James Morris    2007-10-16  5162  
742b99456e86aa Paul Moore      2023-02-15  5163  /**
742b99456e86aa Paul Moore      2023-02-15  5164   * security_xfrm_policy_free() - Free a xfrm security context
742b99456e86aa Paul Moore      2023-02-15  5165   * @ctx: xfrm security context
742b99456e86aa Paul Moore      2023-02-15  5166   *
742b99456e86aa Paul Moore      2023-02-15  5167   * Free LSM resources associated with @ctx.
742b99456e86aa Paul Moore      2023-02-15  5168   */
03e1ad7b5d871d Paul Moore      2008-04-12  5169  void security_xfrm_policy_free(struct xfrm_sec_ctx *ctx)
20510f2f4e2dab James Morris    2007-10-16  5170  {
f25fce3e8f1f15 Casey Schaufler 2015-05-02  5171  	call_void_hook(xfrm_policy_free_security, ctx);
20510f2f4e2dab James Morris    2007-10-16  5172  }
20510f2f4e2dab James Morris    2007-10-16  5173  EXPORT_SYMBOL(security_xfrm_policy_free);
20510f2f4e2dab James Morris    2007-10-16  5174  
742b99456e86aa Paul Moore      2023-02-15  5175  /**
742b99456e86aa Paul Moore      2023-02-15  5176   * security_xfrm_policy_delete() - Check if deleting a xfrm policy is allowed
742b99456e86aa Paul Moore      2023-02-15  5177   * @ctx: xfrm security context
742b99456e86aa Paul Moore      2023-02-15  5178   *
742b99456e86aa Paul Moore      2023-02-15  5179   * Authorize deletion of a SPD entry.
742b99456e86aa Paul Moore      2023-02-15  5180   *
742b99456e86aa Paul Moore      2023-02-15  5181   * Return: Returns 0 if permission is granted.
742b99456e86aa Paul Moore      2023-02-15  5182   */
03e1ad7b5d871d Paul Moore      2008-04-12 @5183  int security_xfrm_policy_delete(struct xfrm_sec_ctx *ctx)
20510f2f4e2dab James Morris    2007-10-16  5184  {
260017f31a8c38 Ondrej Mosnacek 2024-01-30  5185  	return call_int_hook(xfrm_policy_delete_security, ctx);
20510f2f4e2dab James Morris    2007-10-16  5186  }
20510f2f4e2dab James Morris    2007-10-16  5187  
742b99456e86aa Paul Moore      2023-02-15  5188  /**
742b99456e86aa Paul Moore      2023-02-15  5189   * security_xfrm_state_alloc() - Allocate a xfrm state LSM blob
742b99456e86aa Paul Moore      2023-02-15  5190   * @x: xfrm state being added to the SAD
742b99456e86aa Paul Moore      2023-02-15  5191   * @sec_ctx: security label provided by userspace
742b99456e86aa Paul Moore      2023-02-15  5192   *
742b99456e86aa Paul Moore      2023-02-15  5193   * Allocate a security structure to the @x->security field; the security field
742b99456e86aa Paul Moore      2023-02-15  5194   * is initialized to NULL when the xfrm_state is allocated. Set the context to
742b99456e86aa Paul Moore      2023-02-15  5195   * correspond to @sec_ctx.
742b99456e86aa Paul Moore      2023-02-15  5196   *
742b99456e86aa Paul Moore      2023-02-15  5197   * Return: Return 0 if operation was successful.
742b99456e86aa Paul Moore      2023-02-15  5198   */
2e5aa86609ec1c Paul Moore      2013-07-23  5199  int security_xfrm_state_alloc(struct xfrm_state *x,
2e5aa86609ec1c Paul Moore      2013-07-23  5200  			      struct xfrm_user_sec_ctx *sec_ctx)
20510f2f4e2dab James Morris    2007-10-16  5201  {
260017f31a8c38 Ondrej Mosnacek 2024-01-30  5202  	return call_int_hook(xfrm_state_alloc, x, sec_ctx);
20510f2f4e2dab James Morris    2007-10-16  5203  }
20510f2f4e2dab James Morris    2007-10-16  5204  EXPORT_SYMBOL(security_xfrm_state_alloc);
20510f2f4e2dab James Morris    2007-10-16  5205  
742b99456e86aa Paul Moore      2023-02-15  5206  /**
742b99456e86aa Paul Moore      2023-02-15  5207   * security_xfrm_state_alloc_acquire() - Allocate a xfrm state LSM blob
742b99456e86aa Paul Moore      2023-02-15  5208   * @x: xfrm state being added to the SAD
742b99456e86aa Paul Moore      2023-02-15  5209   * @polsec: associated policy's security context
742b99456e86aa Paul Moore      2023-02-15  5210   * @secid: secid from the flow
742b99456e86aa Paul Moore      2023-02-15  5211   *
742b99456e86aa Paul Moore      2023-02-15  5212   * Allocate a security structure to the x->security field; the security field
742b99456e86aa Paul Moore      2023-02-15  5213   * is initialized to NULL when the xfrm_state is allocated.  Set the context to
742b99456e86aa Paul Moore      2023-02-15  5214   * correspond to secid.
742b99456e86aa Paul Moore      2023-02-15  5215   *
742b99456e86aa Paul Moore      2023-02-15  5216   * Return: Returns 0 if operation was successful.
742b99456e86aa Paul Moore      2023-02-15  5217   */
20510f2f4e2dab James Morris    2007-10-16 @5218  int security_xfrm_state_alloc_acquire(struct xfrm_state *x,
20510f2f4e2dab James Morris    2007-10-16  5219  				      struct xfrm_sec_ctx *polsec, u32 secid)
20510f2f4e2dab James Morris    2007-10-16  5220  {
260017f31a8c38 Ondrej Mosnacek 2024-01-30  5221  	return call_int_hook(xfrm_state_alloc_acquire, x, polsec, secid);
20510f2f4e2dab James Morris    2007-10-16  5222  }
20510f2f4e2dab James Morris    2007-10-16  5223  
742b99456e86aa Paul Moore      2023-02-15  5224  /**
742b99456e86aa Paul Moore      2023-02-15  5225   * security_xfrm_state_delete() - Check if deleting a xfrm state is allowed
742b99456e86aa Paul Moore      2023-02-15  5226   * @x: xfrm state
742b99456e86aa Paul Moore      2023-02-15  5227   *
742b99456e86aa Paul Moore      2023-02-15  5228   * Authorize deletion of x->security.
742b99456e86aa Paul Moore      2023-02-15  5229   *
742b99456e86aa Paul Moore      2023-02-15  5230   * Return: Returns 0 if permission is granted.
742b99456e86aa Paul Moore      2023-02-15  5231   */
20510f2f4e2dab James Morris    2007-10-16  5232  int security_xfrm_state_delete(struct xfrm_state *x)
20510f2f4e2dab James Morris    2007-10-16  5233  {
260017f31a8c38 Ondrej Mosnacek 2024-01-30  5234  	return call_int_hook(xfrm_state_delete_security, x);
20510f2f4e2dab James Morris    2007-10-16  5235  }
20510f2f4e2dab James Morris    2007-10-16  5236  EXPORT_SYMBOL(security_xfrm_state_delete);
20510f2f4e2dab James Morris    2007-10-16  5237  
742b99456e86aa Paul Moore      2023-02-15  5238  /**
742b99456e86aa Paul Moore      2023-02-15  5239   * security_xfrm_state_free() - Free a xfrm state
742b99456e86aa Paul Moore      2023-02-15  5240   * @x: xfrm state
742b99456e86aa Paul Moore      2023-02-15  5241   *
742b99456e86aa Paul Moore      2023-02-15  5242   * Deallocate x->security.
742b99456e86aa Paul Moore      2023-02-15  5243   */
20510f2f4e2dab James Morris    2007-10-16 @5244  void security_xfrm_state_free(struct xfrm_state *x)
20510f2f4e2dab James Morris    2007-10-16  5245  {
f25fce3e8f1f15 Casey Schaufler 2015-05-02  5246  	call_void_hook(xfrm_state_free_security, x);
20510f2f4e2dab James Morris    2007-10-16  5247  }
20510f2f4e2dab James Morris    2007-10-16  5248  
742b99456e86aa Paul Moore      2023-02-15  5249  /**
742b99456e86aa Paul Moore      2023-02-15  5250   * security_xfrm_policy_lookup() - Check if using a xfrm policy is allowed
742b99456e86aa Paul Moore      2023-02-15  5251   * @ctx: target xfrm security context
742b99456e86aa Paul Moore      2023-02-15  5252   * @fl_secid: flow secid used to authorize access
742b99456e86aa Paul Moore      2023-02-15  5253   *
742b99456e86aa Paul Moore      2023-02-15  5254   * Check permission when a flow selects a xfrm_policy for processing XFRMs on a
742b99456e86aa Paul Moore      2023-02-15  5255   * packet.  The hook is called when selecting either a per-socket policy or a
742b99456e86aa Paul Moore      2023-02-15  5256   * generic xfrm policy.
742b99456e86aa Paul Moore      2023-02-15  5257   *
742b99456e86aa Paul Moore      2023-02-15  5258   * Return: Return 0 if permission is granted, -ESRCH otherwise, or -errno on
742b99456e86aa Paul Moore      2023-02-15  5259   *         other errors.
742b99456e86aa Paul Moore      2023-02-15  5260   */
8a922805fb0950 Zhongjun Tan    2021-04-09 @5261  int security_xfrm_policy_lookup(struct xfrm_sec_ctx *ctx, u32 fl_secid)
20510f2f4e2dab James Morris    2007-10-16  5262  {
260017f31a8c38 Ondrej Mosnacek 2024-01-30  5263  	return call_int_hook(xfrm_policy_lookup, ctx, fl_secid);
20510f2f4e2dab James Morris    2007-10-16  5264  }
20510f2f4e2dab James Morris    2007-10-16  5265  
742b99456e86aa Paul Moore      2023-02-15  5266  /**
742b99456e86aa Paul Moore      2023-02-15  5267   * security_xfrm_state_pol_flow_match() - Check for a xfrm match
742b99456e86aa Paul Moore      2023-02-15  5268   * @x: xfrm state to match
1e2523d745cff3 Paul Moore      2023-03-08  5269   * @xp: xfrm policy to check for a match
742b99456e86aa Paul Moore      2023-02-15  5270   * @flic: flow to check for a match.
742b99456e86aa Paul Moore      2023-02-15  5271   *
742b99456e86aa Paul Moore      2023-02-15  5272   * Check @xp and @flic for a match with @x.
742b99456e86aa Paul Moore      2023-02-15  5273   *
742b99456e86aa Paul Moore      2023-02-15  5274   * Return: Returns 1 if there is a match.
742b99456e86aa Paul Moore      2023-02-15  5275   */
20510f2f4e2dab James Morris    2007-10-16 @5276  int security_xfrm_state_pol_flow_match(struct xfrm_state *x,
e33f770426674a David S. Miller 2011-02-22  5277  				       struct xfrm_policy *xp,
3df98d79215ace Paul Moore      2020-09-27  5278  				       const struct flowi_common *flic)
20510f2f4e2dab James Morris    2007-10-16  5279  {
b1d9e6b0646d0e Casey Schaufler 2015-05-02  5280  	/*
b1d9e6b0646d0e Casey Schaufler 2015-05-02  5281  	 * Since this function is expected to return 0 or 1, the judgment
b1d9e6b0646d0e Casey Schaufler 2015-05-02  5282  	 * becomes difficult if multiple LSMs supply this call. Fortunately,
b1d9e6b0646d0e Casey Schaufler 2015-05-02  5283  	 * we can use the first LSM's judgment because currently only SELinux
b1d9e6b0646d0e Casey Schaufler 2015-05-02  5284  	 * supplies this call.
b1d9e6b0646d0e Casey Schaufler 2015-05-02  5285  	 */
126d968c88f643 kpsingh         2024-04-26  5286  	return call_int_hook(xfrm_state_pol_flow_match, x, xp, flic);
20510f2f4e2dab James Morris    2007-10-16  5287  }
20510f2f4e2dab James Morris    2007-10-16  5288  
742b99456e86aa Paul Moore      2023-02-15  5289  /**
742b99456e86aa Paul Moore      2023-02-15  5290   * security_xfrm_decode_session() - Determine the xfrm secid for a packet
742b99456e86aa Paul Moore      2023-02-15  5291   * @skb: xfrm packet
742b99456e86aa Paul Moore      2023-02-15  5292   * @secid: secid
742b99456e86aa Paul Moore      2023-02-15  5293   *
742b99456e86aa Paul Moore      2023-02-15  5294   * Decode the packet in @skb and return the security label in @secid.
742b99456e86aa Paul Moore      2023-02-15  5295   *
742b99456e86aa Paul Moore      2023-02-15  5296   * Return: Return 0 if all xfrms used have the same secid.
742b99456e86aa Paul Moore      2023-02-15  5297   */
20510f2f4e2dab James Morris    2007-10-16 @5298  int security_xfrm_decode_session(struct sk_buff *skb, u32 *secid)
20510f2f4e2dab James Morris    2007-10-16  5299  {
260017f31a8c38 Ondrej Mosnacek 2024-01-30  5300  	return call_int_hook(xfrm_decode_session, skb, secid, 1);
20510f2f4e2dab James Morris    2007-10-16  5301  }
20510f2f4e2dab James Morris    2007-10-16  5302  
3df98d79215ace Paul Moore      2020-09-27  5303  void security_skb_classify_flow(struct sk_buff *skb, struct flowi_common *flic)
20510f2f4e2dab James Morris    2007-10-16  5304  {
260017f31a8c38 Ondrej Mosnacek 2024-01-30  5305  	int rc = call_int_hook(xfrm_decode_session, skb, &flic->flowic_secid,
f25fce3e8f1f15 Casey Schaufler 2015-05-02  5306  			       0);
20510f2f4e2dab James Morris    2007-10-16  5307  
20510f2f4e2dab James Morris    2007-10-16  5308  	BUG_ON(rc);
20510f2f4e2dab James Morris    2007-10-16  5309  }
20510f2f4e2dab James Morris    2007-10-16  5310  EXPORT_SYMBOL(security_skb_classify_flow);
20510f2f4e2dab James Morris    2007-10-16  5311  #endif	/* CONFIG_SECURITY_NETWORK_XFRM */
20510f2f4e2dab James Morris    2007-10-16  5312  
20510f2f4e2dab James Morris    2007-10-16  5313  #ifdef CONFIG_KEYS
ecc419a4453530 Paul Moore      2023-02-15  5314  /**
ecc419a4453530 Paul Moore      2023-02-15  5315   * security_key_alloc() - Allocate and initialize a kernel key LSM blob
ecc419a4453530 Paul Moore      2023-02-15  5316   * @key: key
ecc419a4453530 Paul Moore      2023-02-15  5317   * @cred: credentials
ecc419a4453530 Paul Moore      2023-02-15  5318   * @flags: allocation flags
ecc419a4453530 Paul Moore      2023-02-15  5319   *
ecc419a4453530 Paul Moore      2023-02-15  5320   * Permit allocation of a key and assign security data. Note that key does not
ecc419a4453530 Paul Moore      2023-02-15  5321   * have a serial number assigned at this point.
ecc419a4453530 Paul Moore      2023-02-15  5322   *
ecc419a4453530 Paul Moore      2023-02-15  5323   * Return: Return 0 if permission is granted, -ve error otherwise.
ecc419a4453530 Paul Moore      2023-02-15  5324   */
d84f4f992cbd76 David Howells   2008-11-14 @5325  int security_key_alloc(struct key *key, const struct cred *cred,
d84f4f992cbd76 David Howells   2008-11-14  5326  		       unsigned long flags)
20510f2f4e2dab James Morris    2007-10-16  5327  {
260017f31a8c38 Ondrej Mosnacek 2024-01-30  5328  	return call_int_hook(key_alloc, key, cred, flags);
20510f2f4e2dab James Morris    2007-10-16  5329  }
20510f2f4e2dab James Morris    2007-10-16  5330  
ecc419a4453530 Paul Moore      2023-02-15  5331  /**
ecc419a4453530 Paul Moore      2023-02-15  5332   * security_key_free() - Free a kernel key LSM blob
ecc419a4453530 Paul Moore      2023-02-15  5333   * @key: key
ecc419a4453530 Paul Moore      2023-02-15  5334   *
ecc419a4453530 Paul Moore      2023-02-15  5335   * Notification of destruction; free security data.
ecc419a4453530 Paul Moore      2023-02-15  5336   */
20510f2f4e2dab James Morris    2007-10-16 @5337  void security_key_free(struct key *key)
20510f2f4e2dab James Morris    2007-10-16  5338  {
f25fce3e8f1f15 Casey Schaufler 2015-05-02  5339  	call_void_hook(key_free, key);
20510f2f4e2dab James Morris    2007-10-16  5340  }
20510f2f4e2dab James Morris    2007-10-16  5341  
ecc419a4453530 Paul Moore      2023-02-15  5342  /**
ecc419a4453530 Paul Moore      2023-02-15  5343   * security_key_permission() - Check if a kernel key operation is allowed
ecc419a4453530 Paul Moore      2023-02-15  5344   * @key_ref: key reference
ecc419a4453530 Paul Moore      2023-02-15  5345   * @cred: credentials of actor requesting access
ecc419a4453530 Paul Moore      2023-02-15  5346   * @need_perm: requested permissions
ecc419a4453530 Paul Moore      2023-02-15  5347   *
ecc419a4453530 Paul Moore      2023-02-15  5348   * See whether a specific operational right is granted to a process on a key.
ecc419a4453530 Paul Moore      2023-02-15  5349   *
ecc419a4453530 Paul Moore      2023-02-15  5350   * Return: Return 0 if permission is granted, -ve error otherwise.
ecc419a4453530 Paul Moore      2023-02-15  5351   */
8c0637e950d689 David Howells   2020-05-12 @5352  int security_key_permission(key_ref_t key_ref, const struct cred *cred,
8c0637e950d689 David Howells   2020-05-12  5353  			    enum key_need_perm need_perm)
20510f2f4e2dab James Morris    2007-10-16  5354  {
260017f31a8c38 Ondrej Mosnacek 2024-01-30  5355  	return call_int_hook(key_permission, key_ref, cred, need_perm);
20510f2f4e2dab James Morris    2007-10-16  5356  }
20510f2f4e2dab James Morris    2007-10-16  5357  

:::::: The code at line 5298 was first introduced by commit
:::::: 20510f2f4e2dabb0ff6c13901807627ec9452f98 security: Convert LSM into a static interface

:::::: TO: James Morris <jmorris@namei.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
