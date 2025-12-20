Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D06186341
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766232118; cv=none; b=uNue0jQgRLHyRh9ou5kjV8krHACRBmdA4LxdhxBsVnK4CAyn3qwgcgOcyiTk+yOqPG2RdKO39kC6dauZpN/GHn+DNC7ceTlmjTUJJBcO43CPlxCOl3kACNe1nLW4cNiJd4e3C/EhjxqzIK0id5ZBA7hRjZQcP3JbX4Om8XnEsvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766232118; c=relaxed/simple;
	bh=eFyDNCxRMABBNavML/nPbfBOy/ESkdBQiUJx4CyX+Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=REKc04qZnVBwHw5W014aHZBpI14cloQyA++CA2gjTqEe7rYppl1wvhgAD7YOoAIbYG+tduYfosDh5WMLG2sQ3OaRIxzHy/2CkD1IhZO2+Hqi+YT4qsokhqCIU6nSChtp4aJN6I9XGUDUeMrZ3GW27HWXCUfBNQb/FNwwGfH0lmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkSN1EzO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkSN1EzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766232116; x=1797768116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFyDNCxRMABBNavML/nPbfBOy/ESkdBQiUJx4CyX+Zw=;
  b=EkSN1EzOq0mgIR6I9h5RLApZD8rJgqYXFH9rl3YRmon2DmUVSBEimJEt
   QRLPJDmX4MGhcYLK+xnNOjOQUZ/ym3dzgqMf2eq1BmBaShzl1072McVhl
   sn/rYdSjdcWLO086L8fZvP48+KrW5usEdLOFXBHXJRaeYc4fHcYN5ws8F
   mTKv3BcxRk4bGcQPjm1qi8WCe7qj5MJd2fmc+jSJsW41mSCbcIfXYpVjy
   RrFYe1NeHGfRxwjpfvYTgtT1Xk7bLjWeF5jv2jPaemVXE9KrX7OeDkQ0v
   KipotM0oOGtriAqeFlnfFkl4CEQFWITtWhRnmPa/hsExSh945k2qkZuHf
   Q==;
X-CSE-ConnectionGUID: y9z5KpXKRm27/Zl+A1U9Zw==
X-CSE-MsgGUID: pqMnRY/CQUCv0cM20Kj3Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68049915"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68049915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 04:01:52 -0800
X-CSE-ConnectionGUID: DS/Jdh8dQP+MRcOTmxSZFw==
X-CSE-MsgGUID: lGB35h6+SZmEU97kY/7mow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203528229"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Dec 2025 04:01:51 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWvee-000000004W6-3TpO;
	Sat, 20 Dec 2025 12:01:48 +0000
Date: Sat, 20 Dec 2025 20:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: pr-hung <bkedx0000@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/28 1/1] net/ipv4/netfilter/ip_tables.c:361:9:
 warning: parameter names (without types) in function declaration
Message-ID: <202512201938.djfgnD4g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa pr/28
head:   76e15fe6ef9321298cff1ef706e46852baa4915b
commit: 76e15fe6ef9321298cff1ef706e46852baa4915b [1/1] Fix potential vulnerability in cloned code (net/ipv4/netfilter/ip_tables.c)
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512201938.djfgnD4g-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201938.djfgnD4g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201938.djfgnD4g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/netfilter/ip_tables.c: In function 'ipt_do_table':
   net/ipv4/netfilter/ip_tables.c:329:29: warning: statement with no effect [-Wunused-value]
     329 |                             !(e->ip.flags & IPT_F_GOTO)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:329:56: error: expected ';' before ')' token
     329 |                             !(e->ip.flags & IPT_F_GOTO)) {
         |                                                        ^
         |                                                        ;
   net/ipv4/netfilter/ip_tables.c:329:56: error: expected statement before ')' token
   net/ipv4/netfilter/ip_tables.c:331:33: error: expected expression before 'if'
     331 |                                 if (unlikely(stackidx >= private->stacksize)) {
         |                                 ^~
   net/ipv4/netfilter/ip_tables.c:340:25: error: expected expression before '}' token
     340 |                         }
         |                         ^
   net/ipv4/netfilter/ip_tables.c:343:51: error: 'v' undeclared (first use in this function)
     343 |                         e = get_entry(table_base, v);
         |                                                   ^
   net/ipv4/netfilter/ip_tables.c:343:51: note: each undeclared identifier is reported only once for each function it appears in
   net/ipv4/netfilter/ip_tables.c:347:17: error: expected 'while' before 'acpar'
     347 |                 acpar.target   = t->u.kernel.target;
         |                 ^~~~~
   net/ipv4/netfilter/ip_tables.c:348:34: error: 't' undeclared (first use in this function)
     348 |                 acpar.targinfo = t->data;
         |                                  ^
   net/ipv4/netfilter/ip_tables.c:357:25: error: break statement not within loop or switch
     357 |                         break;
         |                         ^~~~~
   net/ipv4/netfilter/ip_tables.c:239:22: warning: variable 'addend' set but not used [-Wunused-but-set-variable]
     239 |         unsigned int addend;
         |                      ^~~~~~
   net/ipv4/netfilter/ip_tables.c: At top level:
   net/ipv4/netfilter/ip_tables.c:359:11: error: expected identifier or '(' before 'while'
     359 |         } while (!acpar.hotdrop);
         |           ^~~~~
   net/ipv4/netfilter/ip_tables.c:361:9: warning: data definition has no type or storage class
     361 |         xt_write_recseq_end(addend);
         |         ^~~~~~~~~~~~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:361:9: error: type defaults to 'int' in declaration of 'xt_write_recseq_end' [-Werror=implicit-int]
>> net/ipv4/netfilter/ip_tables.c:361:9: warning: parameter names (without types) in function declaration
   net/ipv4/netfilter/ip_tables.c:361:9: error: conflicting types for 'xt_write_recseq_end'; have 'int()'
   In file included from net/ipv4/netfilter/ip_tables.c:25:
   include/linux/netfilter/x_tables.h:383:20: note: previous definition of 'xt_write_recseq_end' with type 'void(unsigned int)'
     383 | static inline void xt_write_recseq_end(unsigned int addend)
         |                    ^~~~~~~~~~~~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:362:9: warning: data definition has no type or storage class
     362 |         local_bh_enable();
         |         ^~~~~~~~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:362:9: error: type defaults to 'int' in declaration of 'local_bh_enable' [-Werror=implicit-int]
   net/ipv4/netfilter/ip_tables.c:362:9: error: function declaration isn't a prototype [-Werror=strict-prototypes]
   net/ipv4/netfilter/ip_tables.c:362:9: error: conflicting types for 'local_bh_enable'; have 'int()'
   In file included from include/linux/spinlock.h:62,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from net/ipv4/netfilter/ip_tables.c:12:
   include/linux/bottom_half.h:31:20: note: previous definition of 'local_bh_enable' with type 'void(void)'
      31 | static inline void local_bh_enable(void)
         |                    ^~~~~~~~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:364:9: error: expected identifier or '(' before 'if'
     364 |         if (acpar.hotdrop)
         |         ^~
   net/ipv4/netfilter/ip_tables.c:366:9: error: expected identifier or '(' before 'else'
     366 |         else return verdict;
         |         ^~~~
   net/ipv4/netfilter/ip_tables.c:367:1: error: expected identifier or '(' before '}' token
     367 | }
         | ^
   net/ipv4/netfilter/ip_tables.c: In function 'ipt_do_table':
   net/ipv4/netfilter/ip_tables.c:359:9: warning: control reaches end of non-void function [-Wreturn-type]
     359 |         } while (!acpar.hotdrop);
         |         ^
   cc1: some warnings being treated as errors


vim +361 net/ipv4/netfilter/ip_tables.c

98e86403162d08a Jan Engelhardt            2009-04-15  220  
^1da177e4c3f415 Linus Torvalds            2005-04-16  221  /* Returns one of the generic firewall policies, like NF_ACCEPT. */
^1da177e4c3f415 Linus Torvalds            2005-04-16  222  unsigned int
8844e01062ddd81 Florian Westphal          2021-10-11  223  ipt_do_table(void *priv,
8844e01062ddd81 Florian Westphal          2021-10-11  224  	     struct sk_buff *skb,
8844e01062ddd81 Florian Westphal          2021-10-11  225  	     const struct nf_hook_state *state)
^1da177e4c3f415 Linus Torvalds            2005-04-16  226  {
8844e01062ddd81 Florian Westphal          2021-10-11  227  	const struct xt_table *table = priv;
6cb8ff3f1a535b1 Eric W. Biederman         2015-09-18  228  	unsigned int hook = state->hook;
^1da177e4c3f415 Linus Torvalds            2005-04-16  229  	static const char nulldevname[IFNAMSIZ] __attribute__((aligned(sizeof(long))));
5452e425adfdfc4 Jan Engelhardt            2008-04-14  230  	const struct iphdr *ip;
^1da177e4c3f415 Linus Torvalds            2005-04-16  231  	/* Initializing verdict to NF_DROP keeps gcc happy. */
^1da177e4c3f415 Linus Torvalds            2005-04-16  232  	unsigned int verdict = NF_DROP;
^1da177e4c3f415 Linus Torvalds            2005-04-16  233  	const char *indev, *outdev;
d5d1baa15f5b05e Jan Engelhardt            2009-06-26  234  	const void *table_base;
f3c5c1bfd430858 Jan Engelhardt            2010-04-19  235  	struct ipt_entry *e, **jumpstack;
7814b6ec6d0d634 Florian Westphal          2015-07-14  236  	unsigned int stackidx, cpu;
d5d1baa15f5b05e Jan Engelhardt            2009-06-26  237  	const struct xt_table_info *private;
de74c1699628725 Jan Engelhardt            2009-07-05  238  	struct xt_action_param acpar;
7f5c6d4f665bb57 Eric Dumazet              2011-04-04  239  	unsigned int addend;
^1da177e4c3f415 Linus Torvalds            2005-04-16  240  
^1da177e4c3f415 Linus Torvalds            2005-04-16  241  	/* Initialization */
7814b6ec6d0d634 Florian Westphal          2015-07-14  242  	stackidx = 0;
3db05fea51cdb16 Herbert Xu                2007-10-15  243  	ip = ip_hdr(skb);
1c491ba2592f621 David S. Miller           2015-04-03  244  	indev = state->in ? state->in->name : nulldevname;
1c491ba2592f621 David S. Miller           2015-04-03  245  	outdev = state->out ? state->out->name : nulldevname;
^1da177e4c3f415 Linus Torvalds            2005-04-16  246  	/* We handle fragments by dealing with the first fragment as
^1da177e4c3f415 Linus Torvalds            2005-04-16  247  	 * if it was a normal packet.  All other fragments are treated
^1da177e4c3f415 Linus Torvalds            2005-04-16  248  	 * normally, except that they will NEVER match rules that ask
^1da177e4c3f415 Linus Torvalds            2005-04-16  249  	 * things we don't know, ie. tcp syn flag or ports).  If the
^1da177e4c3f415 Linus Torvalds            2005-04-16  250  	 * rule is also a fragment-specific rule, non-fragments won't
^1da177e4c3f415 Linus Torvalds            2005-04-16  251  	 * match it. */
de74c1699628725 Jan Engelhardt            2009-07-05  252  	acpar.fragoff = ntohs(ip->frag_off) & IP_OFFSET;
de74c1699628725 Jan Engelhardt            2009-07-05  253  	acpar.thoff   = ip_hdrlen(skb);
b4ba26119b06052 Jan Engelhardt            2009-07-07  254  	acpar.hotdrop = false;
613dbd95723aee7 Pablo Neira Ayuso         2016-11-03  255  	acpar.state   = state;
^1da177e4c3f415 Linus Torvalds            2005-04-16  256  
9efdb14f76f4d75 Varsha Rao                2017-08-30  257  	WARN_ON(!(table->valid_hooks & (1 << hook)));
7f5c6d4f665bb57 Eric Dumazet              2011-04-04  258  	local_bh_disable();
7f5c6d4f665bb57 Eric Dumazet              2011-04-04  259  	addend = xt_write_recseq_begin();
d3d40f237480abf Mark Tomlinson            2021-03-08  260  	private = READ_ONCE(table->private); /* Address dependency. */
f3c5c1bfd430858 Jan Engelhardt            2010-04-19  261  	cpu        = smp_processor_id();
482cfc318559e25 Florian Westphal          2015-06-11  262  	table_base = private->entries;
f3c5c1bfd430858 Jan Engelhardt            2010-04-19  263  	jumpstack  = (struct ipt_entry **)private->jumpstack[cpu];
7814b6ec6d0d634 Florian Westphal          2015-07-14  264  
7814b6ec6d0d634 Florian Westphal          2015-07-14  265  	/* Switch to alternate jumpstack if we're being invoked via TEE.
7814b6ec6d0d634 Florian Westphal          2015-07-14  266  	 * TEE issues XT_CONTINUE verdict on original skb so we must not
7814b6ec6d0d634 Florian Westphal          2015-07-14  267  	 * clobber the jumpstack.
7814b6ec6d0d634 Florian Westphal          2015-07-14  268  	 *
7814b6ec6d0d634 Florian Westphal          2015-07-14  269  	 * For recursion via REJECT or SYNPROXY the stack will be clobbered
7814b6ec6d0d634 Florian Westphal          2015-07-14  270  	 * but it is no problem since absolute verdict is issued by these.
7814b6ec6d0d634 Florian Westphal          2015-07-14  271  	 */
dcebd3153e0a774 Florian Westphal          2015-07-14  272  	if (static_key_false(&xt_tee_enabled))
a1f1acb9c5db9b3 Sebastian Andrzej Siewior 2025-05-12  273  		jumpstack += private->stacksize * current->in_nf_duplicate;
784544739a25c30 Stephen Hemminger         2009-02-20  274  
2e4e6a17af35be3 Harald Welte              2006-01-12  275  	e = get_entry(table_base, private->hook_entry[hook]);
^1da177e4c3f415 Linus Torvalds            2005-04-16  276  
^1da177e4c3f415 Linus Torvalds            2005-04-16  277  	do {
87a2e70db62fec7 Jan Engelhardt            2010-10-13  278  		const struct xt_entry_target *t;
dcea992aca82cb0 Jan Engelhardt            2010-02-24  279  		const struct xt_entry_match *ematch;
71ae0dff02d756e Florian Westphal          2015-06-11  280  		struct xt_counters *counter;
a1ff4ac84e58503 Jan Engelhardt            2009-04-15  281  
9efdb14f76f4d75 Varsha Rao                2017-08-30  282  		WARN_ON(!e);
a1ff4ac84e58503 Jan Engelhardt            2009-04-15  283  		if (!ip_packet_match(ip, indev, outdev,
de74c1699628725 Jan Engelhardt            2009-07-05  284  		    &e->ip, acpar.fragoff)) {
dcea992aca82cb0 Jan Engelhardt            2010-02-24  285   no_match:
a1ff4ac84e58503 Jan Engelhardt            2009-04-15  286  			e = ipt_next_entry(e);
a1ff4ac84e58503 Jan Engelhardt            2009-04-15  287  			continue;
a1ff4ac84e58503 Jan Engelhardt            2009-04-15  288  		}
^1da177e4c3f415 Linus Torvalds            2005-04-16  289  
ef53d702c3614fb Jan Engelhardt            2009-07-09  290  		xt_ematch_foreach(ematch, e) {
de74c1699628725 Jan Engelhardt            2009-07-05  291  			acpar.match     = ematch->u.kernel.match;
de74c1699628725 Jan Engelhardt            2009-07-05  292  			acpar.matchinfo = ematch->data;
de74c1699628725 Jan Engelhardt            2009-07-05  293  			if (!acpar.match->match(skb, &acpar))
dcea992aca82cb0 Jan Engelhardt            2010-02-24  294  				goto no_match;
ef53d702c3614fb Jan Engelhardt            2009-07-09  295  		}
dcea992aca82cb0 Jan Engelhardt            2010-02-24  296  
71ae0dff02d756e Florian Westphal          2015-06-11  297  		counter = xt_get_this_cpu_counter(&e->counters);
71ae0dff02d756e Florian Westphal          2015-06-11  298  		ADD_COUNTER(*counter, skb->len, 1);
^1da177e4c3f415 Linus Torvalds            2005-04-16  299  
dc3c09d327220db Taehee Yoo                2018-04-13  300  		t = ipt_get_target_c(e);
9efdb14f76f4d75 Varsha Rao                2017-08-30  301  		WARN_ON(!t->u.kernel.target);
ba9dda3ab5a8655 Jozsef Kadlecsik          2007-07-07  302  
f0165888610a170 Gao feng                  2013-03-21  303  #if IS_ENABLED(CONFIG_NETFILTER_XT_TARGET_TRACE)
ba9dda3ab5a8655 Jozsef Kadlecsik          2007-07-07  304  		/* The packet is traced: log it */
3db05fea51cdb16 Herbert Xu                2007-10-15  305  		if (unlikely(skb->nf_trace))
9dff2c966a0a79a Eric W. Biederman         2015-09-15  306  			trace_packet(state->net, skb, hook, state->in,
9dff2c966a0a79a Eric W. Biederman         2015-09-15  307  				     state->out, table->name, private, e);
ba9dda3ab5a8655 Jozsef Kadlecsik          2007-07-07  308  #endif
^1da177e4c3f415 Linus Torvalds            2005-04-16  309  		/* Standard target? */
^1da177e4c3f415 Linus Torvalds            2005-04-16  310  		if (!t->u.kernel.target->target) {
^1da177e4c3f415 Linus Torvalds            2005-04-16  311  			int v;
^1da177e4c3f415 Linus Torvalds            2005-04-16  312  
87a2e70db62fec7 Jan Engelhardt            2010-10-13  313  			v = ((struct xt_standard_target *)t)->verdict;
^1da177e4c3f415 Linus Torvalds            2005-04-16  314  			if (v < 0) {
^1da177e4c3f415 Linus Torvalds            2005-04-16  315  				/* Pop from stack? */
243bf6e29eef642 Jan Engelhardt            2010-10-13  316  				if (v != XT_RETURN) {
95c961747284a6b Eric Dumazet              2012-04-15  317  					verdict = (unsigned int)(-v) - 1;
^1da177e4c3f415 Linus Torvalds            2005-04-16  318  					break;
^1da177e4c3f415 Linus Torvalds            2005-04-16  319  				}
7814b6ec6d0d634 Florian Westphal          2015-07-14  320  				if (stackidx == 0) {
f3c5c1bfd430858 Jan Engelhardt            2010-04-19  321  					e = get_entry(table_base,
f3c5c1bfd430858 Jan Engelhardt            2010-04-19  322  					    private->underflow[hook]);
f3c5c1bfd430858 Jan Engelhardt            2010-04-19  323  				} else {
7814b6ec6d0d634 Florian Westphal          2015-07-14  324  					e = jumpstack[--stackidx];
f3c5c1bfd430858 Jan Engelhardt            2010-04-19  325  					e = ipt_next_entry(e);
f3c5c1bfd430858 Jan Engelhardt            2010-04-19  326  				}
^1da177e4c3f415 Linus Torvalds            2005-04-16  327  				continue;
^1da177e4c3f415 Linus Torvalds            2005-04-16  328  			}
57ebd808a97d7c5 Florian Westphal          2018-02-07  329  			    !(e->ip.flags & IPT_F_GOTO)) {
76e15fe6ef93212 pr-hung                   2025-12-18  330  			if (table_base + v != ipt_next_entry(e) &&
57ebd808a97d7c5 Florian Westphal          2018-02-07  331  				if (unlikely(stackidx >= private->stacksize)) {
76e15fe6ef93212 pr-hung                   2025-12-18  332  				if (unlikely(stackidx >= private->stacksize)) {
76e15fe6ef93212 pr-hung                   2025-12-18  333  					verdict = NF_DROP;
57ebd808a97d7c5 Florian Westphal          2018-02-07  334  					verdict = NF_DROP;
57ebd808a97d7c5 Florian Westphal          2018-02-07  335  					break;
76e15fe6ef93212 pr-hung                   2025-12-18  336  					break;
76e15fe6ef93212 pr-hung                   2025-12-18  337  				}
57ebd808a97d7c5 Florian Westphal          2018-02-07  338  				}
7814b6ec6d0d634 Florian Westphal          2015-07-14  339  				jumpstack[stackidx++] = e;
57ebd808a97d7c5 Florian Westphal          2018-02-07  340  			}
76e15fe6ef93212 pr-hung                   2025-12-18  341  			}
^1da177e4c3f415 Linus Torvalds            2005-04-16  342  
^1da177e4c3f415 Linus Torvalds            2005-04-16  343  			e = get_entry(table_base, v);
7a6b1c46e28ab05 Jan Engelhardt            2009-04-15  344  			continue;
7a6b1c46e28ab05 Jan Engelhardt            2009-04-15  345  		}
7a6b1c46e28ab05 Jan Engelhardt            2009-04-15  346  
de74c1699628725 Jan Engelhardt            2009-07-05  347  		acpar.target   = t->u.kernel.target;
de74c1699628725 Jan Engelhardt            2009-07-05  348  		acpar.targinfo = t->data;
bb70dfa5f8ab4a0 Jan Engelhardt            2009-04-15  349  
de74c1699628725 Jan Engelhardt            2009-07-05  350  		verdict = t->u.kernel.target->target(skb, &acpar);
9beceb54fa2c0b4 Taehee Yoo                2017-07-27  351  		if (verdict == XT_CONTINUE) {
^1da177e4c3f415 Linus Torvalds            2005-04-16  352  			/* Target might have changed stuff. */
3db05fea51cdb16 Herbert Xu                2007-10-15  353  			ip = ip_hdr(skb);
98e86403162d08a Jan Engelhardt            2009-04-15  354  			e = ipt_next_entry(e);
9beceb54fa2c0b4 Taehee Yoo                2017-07-27  355  		} else {
^1da177e4c3f415 Linus Torvalds            2005-04-16  356  			/* Verdict */
^1da177e4c3f415 Linus Torvalds            2005-04-16  357  			break;
9beceb54fa2c0b4 Taehee Yoo                2017-07-27  358  		}
b4ba26119b06052 Jan Engelhardt            2009-07-07  359  	} while (!acpar.hotdrop);
7814b6ec6d0d634 Florian Westphal          2015-07-14  360  
7f5c6d4f665bb57 Eric Dumazet              2011-04-04 @361  	xt_write_recseq_end(addend);
7f5c6d4f665bb57 Eric Dumazet              2011-04-04  362  	local_bh_enable();
7f5c6d4f665bb57 Eric Dumazet              2011-04-04  363  
b4ba26119b06052 Jan Engelhardt            2009-07-07  364  	if (acpar.hotdrop)
^1da177e4c3f415 Linus Torvalds            2005-04-16  365  		return NF_DROP;
^1da177e4c3f415 Linus Torvalds            2005-04-16  366  	else return verdict;
^1da177e4c3f415 Linus Torvalds            2005-04-16  367  }
^1da177e4c3f415 Linus Torvalds            2005-04-16  368  

:::::: The code at line 361 was first introduced by commit
:::::: 7f5c6d4f665bb57a19a34ce1fb16cc708c04f219 netfilter: get rid of atomic ops in fast path

:::::: TO: Eric Dumazet <eric.dumazet@gmail.com>
:::::: CC: Patrick McHardy <kaber@trash.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
