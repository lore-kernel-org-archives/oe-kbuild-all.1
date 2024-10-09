Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5519D8A7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483781; cv=none; b=nQIyLVVxffqMNWrtxLsLr9UUEVmtkuBvW3Uv1/CXSb6KVm6WkKE3veBVEOq4nbWR4yWNdxnx/EgcsuiS1ObLFh+rd5hFC5ntwm4JAVmifJC44VkLi+3wZCXz/gJyryEPrANnQ6I8yaq4u4ALf/KG6m6SnDZDpQBOvYyj0NKgS+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483781; c=relaxed/simple;
	bh=bC2fIG2JV4wVU2fQzOTMjEcEJxz01Yk2Sea3IIskRxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rmTMSPBXatLRzMZD6zWI4lP2784X611Eea2D8vhJAQzPHZUyhFs81AHyP2B49YGumuQu28quXUJehHBf2uMiMae4gLzCZB4Pi3GguZ2MFaZymXYFeXgcQv3vRNoT2OXeD8z3DCY9/TN5V9PdBpSoJMyuUFLWzakpqc2URpr4UvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kq6XfOuV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kq6XfOuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728483780; x=1760019780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bC2fIG2JV4wVU2fQzOTMjEcEJxz01Yk2Sea3IIskRxQ=;
  b=kq6XfOuVEqrLJ3g2DDrIa1woAZJnkNv3fi1qGYJNCUYM5mtP1VdWdpRH
   vqbNppYhpkKiOIMrBjYvDcslfzvsDZdEk3vJhE4ZatD9sSLcpF63q/EHS
   hJSXanxuuABkfSOo8Jj+3gLOxkU+i8t1HkX+jJDaSwYWseBD0/DgTAAdC
   EhTL/DUCetqRWMjn/vopx6XfDOR63dGcd5iCr+2/lGQLPxBPIOhgf/RTl
   3BqDC9et1cQblVNnGsW9oJt9ggJgqjYqt1lBJjcJy62cQYMr0wW6GkEa5
   WEu84zQmAYtrLr1pClZDq84/5Iap3QKXfEi+t4ZC7ijNaW2n4XGdqeVsj
   A==;
X-CSE-ConnectionGUID: PR4CnL2oQ8eXu6RgsDRG2g==
X-CSE-MsgGUID: SPmKP97nSKuzFXEkgcEIag==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27666976"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="27666976"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 07:22:59 -0700
X-CSE-ConnectionGUID: KKO06vPiSru24b/D6twFCw==
X-CSE-MsgGUID: 4Lmrv502Siaok2zuwrPKjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="77099193"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Oct 2024 07:22:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syXaZ-0009KW-19;
	Wed, 09 Oct 2024 14:22:55 +0000
Date: Wed, 9 Oct 2024 22:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-next 7/7] security/keys/gc.c:337:82: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202410092216.YE4cjglg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-next
head:   46a9e7da56ee22c6fdc73a8b77c0c050cb85dfb3
commit: 46a9e7da56ee22c6fdc73a8b77c0c050cb85dfb3 [7/7] keys: Add tracepoints for the keyrings facility
config: x86_64-randconfig-121-20241009 (https://download.01.org/0day-ci/archive/20241009/202410092216.YE4cjglg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410092216.YE4cjglg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410092216.YE4cjglg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/keys/gc.c:337:82: sparse: sparse: Using plain integer as NULL pointer
   security/keys/gc.c:168:51: sparse: sparse: Using plain integer as NULL pointer

vim +337 security/keys/gc.c

   191	
   192		struct rb_node *cursor;
   193		struct key *key;
   194		time64_t new_timer, limit, expiry;
   195	
   196		kenter("[%lx,%x]", key_gc_flags, gc_state);
   197	
   198		limit = ktime_get_real_seconds();
   199	
   200		/* Work out what we're going to be doing in this pass */
   201		gc_state &= KEY_GC_REAPING_DEAD_1 | KEY_GC_REAPING_DEAD_2;
   202		gc_state <<= 1;
   203		if (test_and_clear_bit(KEY_GC_KEY_EXPIRED, &key_gc_flags))
   204			gc_state |= KEY_GC_REAPING_LINKS;
   205	
   206		if (test_and_clear_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags))
   207			gc_state |= KEY_GC_REAPING_DEAD_1;
   208		kdebug("new pass %x", gc_state);
   209	
   210		new_timer = TIME64_MAX;
   211	
   212		/* As only this function is permitted to remove things from the key
   213		 * serial tree, if cursor is non-NULL then it will always point to a
   214		 * valid node in the tree - even if lock got dropped.
   215		 */
   216		spin_lock(&key_serial_lock);
   217		cursor = rb_first(&key_serial_tree);
   218	
   219	continue_scanning:
   220		while (cursor) {
   221			key = rb_entry(cursor, struct key, serial_node);
   222			cursor = rb_next(cursor);
   223	
   224			if (refcount_read(&key->usage) == 0)
   225				goto found_unreferenced_key;
   226	
   227			if (unlikely(gc_state & KEY_GC_REAPING_DEAD_1)) {
   228				if (key->type == key_gc_dead_keytype) {
   229					gc_state |= KEY_GC_FOUND_DEAD_KEY;
   230					set_bit(KEY_FLAG_DEAD, &key->flags);
   231					key->perm = 0;
   232					goto skip_dead_key;
   233				} else if (key->type == &key_type_keyring &&
   234					   key->restrict_link) {
   235					goto found_restricted_keyring;
   236				}
   237			}
   238	
   239			expiry = key->expiry;
   240			if (expiry != TIME64_MAX) {
   241				if (!(key->type->flags & KEY_TYPE_INSTANT_REAP))
   242					expiry += key_gc_delay;
   243				if (expiry > limit && expiry < new_timer) {
   244					kdebug("will expire %x in %lld",
   245					       key_serial(key), key->expiry - limit);
   246					new_timer = key->expiry;
   247				}
   248			}
   249	
   250			if (unlikely(gc_state & KEY_GC_REAPING_DEAD_2))
   251				if (key->type == key_gc_dead_keytype)
   252					gc_state |= KEY_GC_FOUND_DEAD_KEY;
   253	
   254			if ((gc_state & KEY_GC_REAPING_LINKS) ||
   255			    unlikely(gc_state & KEY_GC_REAPING_DEAD_2)) {
   256				if (key->type == &key_type_keyring)
   257					goto found_keyring;
   258			}
   259	
   260			if (unlikely(gc_state & KEY_GC_REAPING_DEAD_3))
   261				if (key->type == key_gc_dead_keytype)
   262					goto destroy_dead_key;
   263	
   264		skip_dead_key:
   265			if (spin_is_contended(&key_serial_lock) || need_resched())
   266				goto contended;
   267		}
   268	
   269	contended:
   270		spin_unlock(&key_serial_lock);
   271	
   272	maybe_resched:
   273		if (cursor) {
   274			cond_resched();
   275			spin_lock(&key_serial_lock);
   276			goto continue_scanning;
   277		}
   278	
   279		/* We've completed the pass.  Set the timer if we need to and queue a
   280		 * new cycle if necessary.  We keep executing cycles until we find one
   281		 * where we didn't reap any keys.
   282		 */
   283		kdebug("pass complete");
   284	
   285		if (new_timer != TIME64_MAX) {
   286			new_timer += key_gc_delay;
   287			key_schedule_gc(new_timer);
   288		}
   289	
   290		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_2) ||
   291		    !list_empty(&graveyard)) {
   292			/* Make sure that all pending keyring payload destructions are
   293			 * fulfilled and that people aren't now looking at dead or
   294			 * dying keys that they don't have a reference upon or a link
   295			 * to.
   296			 */
   297			kdebug("gc sync");
   298			synchronize_rcu();
   299		}
   300	
   301		if (!list_empty(&graveyard)) {
   302			kdebug("gc keys");
   303			key_gc_unused_keys(&graveyard);
   304		}
   305	
   306		if (unlikely(gc_state & (KEY_GC_REAPING_DEAD_1 |
   307					 KEY_GC_REAPING_DEAD_2))) {
   308			if (!(gc_state & KEY_GC_FOUND_DEAD_KEY)) {
   309				/* No remaining dead keys: short circuit the remaining
   310				 * keytype reap cycles.
   311				 */
   312				kdebug("dead short");
   313				gc_state &= ~(KEY_GC_REAPING_DEAD_1 | KEY_GC_REAPING_DEAD_2);
   314				gc_state |= KEY_GC_REAPING_DEAD_3;
   315			} else {
   316				gc_state |= KEY_GC_REAP_AGAIN;
   317			}
   318		}
   319	
   320		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_3)) {
   321			kdebug("dead wake");
   322			smp_mb();
   323			clear_bit(KEY_GC_REAPING_KEYTYPE, &key_gc_flags);
   324			wake_up_bit(&key_gc_flags, KEY_GC_REAPING_KEYTYPE);
   325		}
   326	
   327		if (gc_state & KEY_GC_REAP_AGAIN)
   328			schedule_work(&key_gc_work);
   329		kleave(" [end %x]", gc_state);
   330		return;
   331	
   332		/* We found an unreferenced key - once we've removed it from the tree,
   333		 * we can safely drop the lock.
   334		 */
   335	found_unreferenced_key:
   336		kdebug("unrefd key %d", key->serial);
 > 337		trace_key_ref(key->serial, refcount_read(&key->usage), key_trace_ref_gc, 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
