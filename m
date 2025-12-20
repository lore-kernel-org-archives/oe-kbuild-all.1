Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF972900A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766240758; cv=none; b=fj0ZubzUk80ZgOJy0NoI/k08SDquFvVHeLdyCsM/ISijQGb5AkZQ+wpVM97u/rkIjBUJORdqc6WDQlM91kFLRL7Z+9MLIWlNNGfXfOPoxikFaKf7HAtVOU2I9v1ouf0FjdvY29atxp8uPxTqcd8Vi+yYy+V4UYmm0yDPahV0PK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766240758; c=relaxed/simple;
	bh=VcZyzhF4yk+9TC8tC7iaX5qI0ejNzxbV91GVwvuysl0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=NBVdQpzrB4yqebRyrnwilLt7SyIUs8GDHBXvFpY+acu5TlvnrOZ8m7ESBKLGjlOj+yup85HsdgMq2jgr/9msWj1vGUrFv8CwtHwWPpGd9SgHB0GIJywrAfrE/x5SFEqHKqhWXuKP0FP+87cZ6fPyKpmcKhFeNyonSYcDueIw9Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=EjJ6otoZ; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="EjJ6otoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=CKcR4qtLgf0cJPB/jGiZN7c/oq9Pt7apdyBxmKMq7hA=;
  b=EjJ6otoZ2AAORmXuk8DJaS+4b90jLm5TQfaGgevhXUjLcZcx8w4EaURB
   jiNHNAsA+JTfzRdUw+NeOt6g9jefSiIM5kgb0AuegoolvzXfOQLCCsKzX
   Lhj8FL0f4QFND1cC9phYoux6HR7N87qqu9VCRipLKEQpdSTilNmc8RDn2
   4=;
X-CSE-ConnectionGUID: YfMhxT28SqeIKLFzjFUJdg==
X-CSE-MsgGUID: h45t1rEvTRaQam5GAuripg==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,164,1763420400"; 
   d="scan'208";a="134265553"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 15:25:47 +0100
Date: Sat, 20 Dec 2025 15:25:46 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Nikunj A Dadhania <nikunj@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
    Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, 
    oe-kbuild-all@lists.linux.dev
Subject: arch/x86/coco/sev/core.c:2838:12-13: WARNING opportunity for
 kfree_sensitive/kvfree_sensitive (memset at line 2837) (fwd)
Message-ID: <a9b57156-4b2-8e62-d083-c85ad9b085db@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sat, 20 Dec 2025 22:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/x86/coco/sev/core.c:2838:12-13: WARNING opportunity for
    kfree_sensitive/kvfree_sensitive (memset at line 2837)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nikunj A Dadhania <nikunj@amd.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Tom Lendacky <thomas.lendacky@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: c5529418d05079384af4dbbb6f6156344c2ffce2 x86/sev: Carve out and export SNP guest messaging init routines
date:   12 months ago
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-104-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202235.WHPQkLZu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512202235.WHPQkLZu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/coco/sev/core.c:2838:12-13: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 2837)

vim +2838 arch/x86/coco/sev/core.c

c5529418d05079 Nikunj A Dadhania 2025-01-06  2825
c5529418d05079 Nikunj A Dadhania 2025-01-06  2826  void snp_msg_free(struct snp_msg_desc *mdesc)
c5529418d05079 Nikunj A Dadhania 2025-01-06  2827  {
c5529418d05079 Nikunj A Dadhania 2025-01-06  2828  	if (!mdesc)
c5529418d05079 Nikunj A Dadhania 2025-01-06  2829  		return;
c5529418d05079 Nikunj A Dadhania 2025-01-06  2830
c5529418d05079 Nikunj A Dadhania 2025-01-06  2831  	kfree(mdesc->ctx);
c5529418d05079 Nikunj A Dadhania 2025-01-06  2832  	free_shared_pages(mdesc->response, sizeof(struct snp_guest_msg));
c5529418d05079 Nikunj A Dadhania 2025-01-06  2833  	free_shared_pages(mdesc->request, sizeof(struct snp_guest_msg));
c5529418d05079 Nikunj A Dadhania 2025-01-06  2834  	free_shared_pages(mdesc->certs_data, SEV_FW_BLOB_MAX_SIZE);
c5529418d05079 Nikunj A Dadhania 2025-01-06  2835  	iounmap((__force void __iomem *)mdesc->secrets);
c5529418d05079 Nikunj A Dadhania 2025-01-06  2836
c5529418d05079 Nikunj A Dadhania 2025-01-06 @2837  	memset(mdesc, 0, sizeof(*mdesc));
c5529418d05079 Nikunj A Dadhania 2025-01-06 @2838  	kfree(mdesc);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
