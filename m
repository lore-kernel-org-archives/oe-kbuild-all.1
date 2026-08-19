Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F35B3AF64B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146335; cv=none; b=tHVb7txRpsKdfJy0gw+p6lCZx/jZDVbv4hQSGYpK0sH78VW2EuHXVgm1QdCPoOClGJrh23WMv/NcLobAZDhTdbUy2jonf/2tlvaEuyLcrvFr/VmIqMo7JS5+G7wze379PsAIRY78IiTc3m++jMZAlIyQRKy4hiOygYvM7hhgou0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146335; c=relaxed/simple;
	bh=EByr9AXNmbPVZQo9tjBdi4J4HcUV8lIADq4ow2Tvrrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SUp0uIDw5l04+adKYwQO9OJTWtYBPhV7mvrmteshXXeJLdqQU/O3cpKAcNFnjd+tHUn1dBdrf1vxtzIRGQCbpw7Wh9qvzYlFee2J0P0Y3VCghid+dUFoOBizIqpBvWNY+klrFCdZlFs5D8Anb+WgtStHOrN0RU5oTS/rykXWFZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dzqrs3m7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dzqrs3m7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-480001972b8so346515f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 06:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787146329; x=1787751129; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Rd270eebvrbTcBx94fHid2ojU8F5U5O89LHfz2gRvo=;
        b=Dzqrs3m7xGviBm+134i1tIMum592vD396ygWD3gmGczU+is03Dl7EnSPV5GYVRftry
         Kg9FvSIqZzUKsI19cG/StPFWAtnls4OR+kTA1uctgJ3syK7q9oF4TaJFK0EEJZG7gYVM
         lITviGOucXyrgjbYxj0C9/b0fb7qBYsap+TYMXpU5TLAEZaALiENoquGz2/Z84BVj7q8
         Xy2oCJaRbcfy3u6AGUQFtxZEN4M5F2XUNo2Bk9aHw5cKCZLNgit4cdfSpgVif6ixHgzJ
         b+h523V+zxSaGD/2E87Q67Sq539mzz3ECWScmYZ2XRfYJ+78/kZdD2xxOuZGsIUpwQDv
         /GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787146329; x=1787751129;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Rd270eebvrbTcBx94fHid2ojU8F5U5O89LHfz2gRvo=;
        b=m/f5o2rQVhcq4SCVa6zMYjF128tn9hCZyyBaMmCOzSquotmYFOVqq6Lf+9uBBm+eKk
         mnnVP74EjziSqqf/d4n8iVRJX1i9eJ1LuzC0H0c0GjsmHtE/lQCOQ+Ti2Lddu/twCBhj
         S8A4arf70VWn0LrwYqnsZfhEFghtC/X3fq8AxqTbg6OrkiE75Yl+m2uRvTqrR4HVzTDb
         j505lbebO1h5I5IryuH3NqiPTHSHz5QwG2+XQqKG2LN/6KOP7914kExpcnV1XQkviqKK
         VkDihd8fkFmX6GrlG3ad4Qfhb+ZVN/o4Zq6uWb6zEE8C3rIfXpgjzHW3/OIgHpiPywC+
         qrbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrL2166ok454sWLVStVj/N/gpTojgigXD/lFLs5B1ytK/OqD/soYaTs57Cosme4590emfQWQAkOkn6l3KFh@lists.linux.dev
X-Gm-Message-State: AFuF++m1gPrkPqqX68TBLyPF50Xc7VKF3PfAgwTaiYvD1hPlK+r3E37f
	mc2zHzUpspUENQ2pQ3kxBLuzYzrIa+olhCUauZ/jrHHMlM58VzofyRur
X-Gm-Gg: AR+sD13CbvaN1wbtxZU2gxZ7r/2+XO+fWBoKipu2mFsBD8XDs1wFFSEUmAVbY48cmbG
	dzsF+11s/nJCrKAyMBvjAnc3d47UAMePgderMThLWTz0K9IlbsYsRmPBUD9uZXEVeJVa2BNveTj
	n6WiP1Tu8c98b0S4wLo4NAeEX9eoHtPvF1xDSfHhMjtlk2lQtMgtpKL21x6saTJSBiCplOIVOZi
	mbKbLtMcXhoR/5MPnN4ZWlW60Vln2EoSNQzilxYEvwfDCLejhIEKz4mw9UdjuIAPXBQoqntqKzX
	oXHDDUtF4DJ9Yu9SnRAs3fYy1IslF+QoWQk2NG+ld+cJJa9fMfaTMY49JiBP6efXxjf7LOAOB6G
	3TQ8LJBGCpCF0StmiQIMp06JrZKv+C5SBKP0WwnL9fvZ7CZCklWKT5QDl4Z2TgmD7Fnhzl0mJ2M
	TbEyv3tbLJRHknpzHKIsXorh+6bbLgTLnADRJAxgys6rpJD9G4Q5tH+IVF
X-Received: by 2002:a05:6000:2209:b0:482:a9d9:64df with SMTP id ffacd0b85a97d-482b1fdcb39mr8382775f8f.12.1787146328601;
        Wed, 19 Aug 2026 06:32:08 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b80a5sm5958636f8f.24.2026.08.19.06.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:32:07 -0700 (PDT)
Date: Wed, 19 Aug 2026 16:32:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-ratelimit-2 73/76] lib/dynamic_debug.c:136
 ddebug_arena_free() warn: sleeping in atomic context
Message-ID: <202608192133.1ujPLawx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-ratelimit-2
head:   31212444bcca4d1547711ec572b5a398d74640ca
commit: 29d01faf08d63c34e46af173536be5af2aaab4fb [73/76] lib/dynamic_debug: Refactor ddebug_arena to vmalloc backing
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260819/202608192133.1ujPLawx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608192133.1ujPLawx-lkp@intel.com/

smatch warnings:
lib/dynamic_debug.c:136 ddebug_arena_free() warn: sleeping in atomic context

vim +136 lib/dynamic_debug.c

b80df25b9600208 Jim Cromie 2026-07-15  125  static void ddebug_arena_free(struct ddebug_arena *arena)
b80df25b9600208 Jim Cromie 2026-07-15  126  {
29d01faf08d63c3 Jim Cromie 2026-08-11  127  	struct ddebug_arena_chunk *chunk, *tmp;
b80df25b9600208 Jim Cromie 2026-07-15  128  	unsigned long flags;
b80df25b9600208 Jim Cromie 2026-07-15  129  	static DEFINE_SPINLOCK(arena_lock);
b80df25b9600208 Jim Cromie 2026-07-15  130  
b80df25b9600208 Jim Cromie 2026-07-15  131  	spin_lock_irqsave(&arena_lock, flags);
b80df25b9600208 Jim Cromie 2026-07-15  132  	arena->free_ptr = NULL;
b80df25b9600208 Jim Cromie 2026-07-15  133  	arena->remaining = 0;
29d01faf08d63c3 Jim Cromie 2026-08-11  134  	list_for_each_entry_safe(chunk, tmp, &arena->chunks, link) {
29d01faf08d63c3 Jim Cromie 2026-08-11  135  		list_del(&chunk->link);
29d01faf08d63c3 Jim Cromie 2026-08-11 @136  		vfree(chunk);

vfree() is a sleeping function so you can't call it while holding
a spinlock.  If you call it from interrupt context, though it doesn't
sleep.  A bit weird like that.

b80df25b9600208 Jim Cromie 2026-07-15  137  	}
b80df25b9600208 Jim Cromie 2026-07-15  138  	spin_unlock_irqrestore(&arena_lock, flags);
b80df25b9600208 Jim Cromie 2026-07-15  139  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

