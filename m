Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3E8320F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 04:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724302051; cv=none; b=TtTr7NJFqVrV20wo1mJ8+VTb5wTbOXpyYAlH0HuEZXdPXG6TnphfOvlvW485eKhlKpD0s1AjjcpqWN5NNwPr6gxNy8HwUU/32U6HOM0nRApUCCyXdyWUFk2c2BW1UJEiaiCmjKXd8ILQ0tlY+m99soPSNqD0VKjF9Uyw7sKYZek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724302051; c=relaxed/simple;
	bh=0AGj/12JTKl3YiTjXIz2PpQRJcKXUTM2lzJMLTiKoIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDRr0UPnH+0fZh2lwRRHRmOF237g/hY2iqPmbFwYdq4/MU+tXfhERunvX1YAjwn9o8TWjH2nwUST6wWldxelgaT2JVNHHmBlthjDUx0pl/UIP3T4Thpqtk+v6cZ9lXtU754VOzQ9C1lABvKBzBcGQaGw+NpnBN929RfVUs8xvQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNMMrYM4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNMMrYM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724302049; x=1755838049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0AGj/12JTKl3YiTjXIz2PpQRJcKXUTM2lzJMLTiKoIE=;
  b=kNMMrYM4/bDMssnZEekz5VWmnP5QFgTTfdqSmgWbBXqDyfdaiZhhxciT
   wU36jKoNrJl0cSCvkci5L5NhWGov6BQxWHG3hekm+2D+Qf+Xz7l9JoUUc
   BdO/z4mh5mbOyIG9rj+qfIkj9600fcCOpP6BazT7vdHsTnJFK0BBUgKkp
   sC1gClPFrZv1lTdABKtMrKKUkYlLETyou90S8k12b+8Q/JEYKH7fHcoe6
   CwvkrGdqwqdC3GLuyUxaARrIgLppn1t/lAZmvtO2qvsBfjjf9f3Z9E1ew
   hVF/+lT3oBRR0iL6hxgloQlt6NaCcCYI7z6p+C/vUFWr4cyCKoAX7jqw0
   A==;
X-CSE-ConnectionGUID: 95tLXkjERZmhZV5UvQNZyw==
X-CSE-MsgGUID: q0M3KYyPRv+eGpQqoXaV7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22865124"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22865124"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 21:47:28 -0700
X-CSE-ConnectionGUID: glZAlUXsRT6vZPSDJFryyQ==
X-CSE-MsgGUID: zn9GCwTaSva2JMhQosWXlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="65668669"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Aug 2024 21:47:27 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgzjJ-000COM-1Q;
	Thu, 22 Aug 2024 04:47:25 +0000
Date: Thu, 22 Aug 2024 12:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-next 7/7] security/keys/gc.c:337:82: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202408221250.k9J2bXYv-lkp@intel.com>
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
config: x86_64-randconfig-123-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221250.k9J2bXYv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221250.k9J2bXYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221250.k9J2bXYv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/keys/gc.c:337:82: sparse: sparse: Using plain integer as NULL pointer
   security/keys/gc.c:168:51: sparse: sparse: Using plain integer as NULL pointer
   security/keys/gc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

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
