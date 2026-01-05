Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408A52F1FD3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608691; cv=none; b=NSZ0XTJSABsdUpcGkmnZKv7D8dnVQ7m9Ew+haaVA+upI2KPs74dK4u1fha5d0iUa32CiPBZC67mWZBA+3tqjwsWeK/ol0tVcu5CI/lnYHpvE2xuKuRn2hNf1uOfOv199DAOI600Cj15JO5eT1GIgnd4M/Vh8sXUDYVWzE5Houjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608691; c=relaxed/simple;
	bh=hynkSKL/5rnpNYk6pUbD2IE0zF4AqQ6fG0fZhpyA3OU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnmGR8SejrBgevSW89rfRsAu82Z07ZWiGb+3bvDlMW7fymYubZXHg/gbQvRkIMxS35YFuke8V1epjq4ib+Eat7xxtf1ay6oKpKDCA/us9otKUXV41cZfz+FDMZJTAJy65RHSssfdrDh91mrQBOzvaFNL/JKVmJoYb+XUf1UmUCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LpMBw5t8; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LpMBw5t8"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so8279317f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 02:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767608686; x=1768213486; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CVwpIkZrNtjo7K4xhpF7v5qG0/6De7/vZGxElqj/NDs=;
        b=LpMBw5t8Qm4Tdc1RycuHqnCjL2ypKTch3nttoEaf4ur5SaZYTLuXVDRryBslfPuwvg
         HFhK7ew3jpmXRLFAXnPzmFqJyVFTGT/qe5mrdU4yZ/aFJaDlixfL5i3k54+5e55m867T
         DM5sYut/1U34jsJP5DkSnIIzdIt20vJ697dtTsE56jrUs2rb6Bvum4G9oCiMtc0Whg9s
         zNYCDwmI79zh4Hh7z12SXZHp+E05TWPjp5qzmAONH4T+DzRXPJV9UrQVvrGZ423CWoxp
         mppHOrAv+6m4SKiz3/4MWQPvS/fAzMfIhpXY+r419nDrhAwrkiOikWmVVrobOOXePdrI
         Iihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608686; x=1768213486;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVwpIkZrNtjo7K4xhpF7v5qG0/6De7/vZGxElqj/NDs=;
        b=uDzckczB/o8lim2DkLNrjDq/Fr9SnByd0lLpxYlenpGMOj8zrIut/wpSf03FexZyCA
         sRkSsHX2TRcbtzxy+ypQOUSUxKt/HKNckI3pJS1xBN6iK7JH7ZaOJ6D0J763KiqIAnUT
         OYG8gU7YhypUIbof0FHJ3F0lgK/I2llVEqbbL9LDVOInT9riHvUXcFQC5ukXpSsNjPi5
         ynWcdh7s49Ctuq30CCnNHJ2SQM5AOKd86QgdIgyY7EsYEm82BB5Sasl55sv0vZtXwOpf
         fmNEIhrAaqqPaepxZncPOwWGqaxXW2PpadCDD32oqGyxk8v0mfo6CBW7LQCd1AlKQMuU
         yQGg==
X-Forwarded-Encrypted: i=1; AJvYcCUraDgBggZxZFyLieRDX85B+ikEf+EEQjo9mJpKcfC3CyPkqudXAl7aGm7A554U0B+zCx0m81xuK1uulQ2+@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz8EgDaxfm4Fu3JOyX8gB0Cne7pfBF2YbkRDNaB6RGbauIx7RE
	yAmshnfDC0idm237yrRItCtrAO5vaOHGNsmC/sOvH5N6920vgMKrW2EI7zBJn7OdOFMrlfwNrt5
	py3uo
X-Gm-Gg: AY/fxX4tVTeU6bhJi4ER+sD/Kx/GjaKAmhI2EPqo47UDdDde907U8dqwccWQECNVA+B
	4pegTfeYqlLZb3s4H5sS8b/mZBabfNgLjpRqxQFaYNBr1YCYIPzbhFtWUZjzeGzEaHMc22a822g
	GJaahf635VJmfPyrr8V706kh4VvCOtUGZ5YPrEDTyXmjz76dr2eBlnqgDTeCM0CSghJZWGbSBtR
	qCSH3FkQ9ZZ66pGptelHDRCMrcuRU9eaUIpww7MjXQIu3WUBIp501MOuSIaczzMA7yS00VFtuLX
	lXqr9OrW0YuMVt3dDtDMCdgObCjy5KG8QzXAgwPmuD0a1nWK+S/djS5x+AJD6dhFRXp1MtxFNne
	21+s024U89KzbUoJXEBWxHGD742gtwztGBByh5LuLhdkvxWsYhcj5iYfP8CcYJTqABaA+WHlJgk
	tzqnjY+98sESu4FI5fBx5HRyqq1z0=
X-Google-Smtp-Source: AGHT+IHNm+wZOjrXrjNYShygi2LlQJkVAnhP/gkeurbFdTsHF4iAlvFX/9d7ZOYqmd4oB5BSSoy85g==
X-Received: by 2002:a05:6000:1861:b0:430:fa9a:74d with SMTP id ffacd0b85a97d-4324e4ca445mr65803624f8f.24.1767608685557;
        Mon, 05 Jan 2026 02:24:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08d9sm99884820f8f.30.2026.01.05.02.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:24:44 -0800 (PST)
Date: Mon, 5 Jan 2026 13:24:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 5/5] kernel/kexec_handover.c:941
 kho_preserve_vmalloc() warn: missing error code 'err'
Message-ID: <202512221523.4WsnhR3e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   3ce6827ad16244f83976f3267e13d63da0613660
commit: a667300bd53f272a3055238bcefe108f88836270 [5/5] kho: add support for preserving vmalloc allocations
config: x86_64-randconfig-r073-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221523.4WsnhR3e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512221523.4WsnhR3e-lkp@intel.com/

smatch warnings:
kernel/kexec_handover.c:941 kho_preserve_vmalloc() warn: missing error code 'err'

vim +/err +941 kernel/kexec_handover.c

a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  907) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  908) {
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  909) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  910) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  911) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  912) 	unsigned int idx = 0;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  913) 	int err;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  914) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  915) 	if (!vm)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  916) 		return -EINVAL;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  917) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  918) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  919) 		return -EOPNOTSUPP;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  920) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  921) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  922) 	order = get_vm_area_page_order(vm);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  923) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  924) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  925) 	if (!chunk)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  926) 		return -ENOMEM;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  927) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  928) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  929) 	nr_contig_pages = (1 << order);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  930) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  931) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  932) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  933) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  934) 		if (err)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  935) 			goto err_free;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  936) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  937) 		chunk->phys[idx++] = phys;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  938) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  939) 			chunk = new_vmalloc_chunk(chunk);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  940) 			if (!chunk)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21 @941) 				goto err_free;

err = -ENOMEM;

a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  942) 			idx = 0;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  943) 		}
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  944) 	}
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  945) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  946) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  947) 	preservation->flags = flags;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  948) 	preservation->order = order;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  949) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  950) 	return 0;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  951) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  952) err_free:
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  953) 	kho_vmalloc_free_chunks(preservation);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  954) 	return err;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  955) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

