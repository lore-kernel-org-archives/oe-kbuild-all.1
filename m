Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FABD3C1D40
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 04:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152315; cv=pass; b=V2ICw7DqaydqkhS69JyTHxS3GuGizxxMaZu+G1tSuLfQqpi5gKGP5KsSpRvxeGjmGyMCJxQZvxYhnlb22HyLsA3PSO/3rEjRQzcg8BMfWrcZZWT5rCjQPt0OU9v0ZPwLnF5vRKH4QZikhdEv2lAiL04Uh62ag0AyGQm55XfHjxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152315; c=relaxed/simple;
	bh=lP9YWmhzl9FoqeWkat1iqsAoNJUyExdIVjFsoX3A0Ag=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A42L+VWqnbZBsZl/TUB2L9/O+ktQfPyiiL7K8XqzKPOId/qlA5F4r9D3bMvGqtNCKVuYF6WSFLmdVz7O/QRkLxDqm0PPoSIaG3rWFCMdyEVHn7uxtlF3aqJ1gvJ+KwgVRVJdfrNiJopURVvrZcRZVke2sDZ2g4zDYzB7IcYSCp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDAEThdt; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDAEThdt"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so4676783a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 21:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788152313; cv=none;
        d=google.com; s=arc-20260327;
        b=m3WWhs8v9K72r+MNmpcqNG1ljOdNgXFDRPtlD4xwnagIQ7fOL4IEFUx0fKaoLzcZVc
         Ly1ro9ptNgW4X6Pm9ASMpHTyfz9JSyvOI4cy3H+cE60QBl9obYcAq+R6SAKm1p3J9exl
         XgS3kReRtT0M59ubK2e0IcYoyfZ3hPfB4bOKW/Vb8i6UeXyLKxVkkcqnZaoK4swxk5Q4
         0Yx8jqhoC23KNGWhS5HyvxF+KpuxdEMJAjFeXSrR8uXqFQbJO++MTWC0UmR64n5Ij4M7
         Wad/AUgrV6nBUWKS8YWJuinUhj9ssl5m3K49DFg6zSPoEyRl+J7tgo7veubHJSiR3zli
         goDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=lP9YWmhzl9FoqeWkat1iqsAoNJUyExdIVjFsoX3A0Ag=;
        fh=9Qzo/MmqeGHXLBQLInXZjJ+TJR2VLfVDsWEBtmMVJwE=;
        b=J146yh9G303meYoCCGJukU8opLb/ytC5eSyjEX91wbZtz0bdDqgCiU4BAJ/nRosM0H
         H4sD2DVDUIaibdd2l9qI7dYZJQ9+K5VTnHPhyFGBMRExnwJAi5bZrBNzvFRjp8oC6Znk
         VXAdxsKaLMuFfue7yTtJu5xLIgTCcs+Az4tTBjKgsXrspB3DLgm/hzMuxfiBCiw3JvdJ
         EJ7rY0LuO1cQv0dzYaZJIvjZ2P2X2P+uWiAkh2XGCNjoUUVJtQHX7nSto0MNtLjMNr9w
         yOowOwJ8b+MOvU7Qbcnl8pGLmxMqP7LKicKl/bUEWS5/hvtv+e3tlV7WeWQq2+tuOBQr
         9oBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788152313; x=1788757113; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lP9YWmhzl9FoqeWkat1iqsAoNJUyExdIVjFsoX3A0Ag=;
        b=EDAEThdt6iU8SC2C896AGc6rMb8Je49FnjrqaxWqBuBJ//UtS7kVslySz4GRjOs0+2
         IuqqZ620fiafIgeqo8MFRlu69SLqFx7FPmAto86ukqw3fIAJBiUpOcprGeLDcz+r52fm
         QXx8fj9HX/8j4zBg8W5pZZUv2mwTYMsx6QG8dcsqxh/UcmeQX21qi13r8m8HkKM/ZCDk
         f7qoVzT3vmZGoEcXqEPOORzU8A2udCEuRHZk2yWZFvuM9I02Rfx5icfF9ZqXp/462m94
         Y/1L/5DjL/X1X6XZ0EpFdFlEX+KKSKgAvv87CddTUcUMzQCeYD9HFk8viyQVi6qAMET+
         J0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788152313; x=1788757113;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lP9YWmhzl9FoqeWkat1iqsAoNJUyExdIVjFsoX3A0Ag=;
        b=WeIwwBLj39eFyq3dcg8CLIkjq9EOHS/eoUknsDfidiqrIndLHQ/2KXNfg9a9JH+dGD
         mSX6F/8ZKLrYadajzzT1ezxF4+NjcXOn0E22PusmMI0StZs6OeNzodnM38BgbOYXdAKu
         bDvQv613fBN3XhMk45MIg33aEAmLsaN9BGTZnUTYfIZeIgI+tNf7zgEJH1U5TCMD6aTy
         hW0YsNbvJIJMGoagAKsflsCNbZnQEF2v/AUNRXoXil7LPtrc1+gg2M6eF1r/0AsWgPz0
         CQnTX3Sj8VGt+mbg0Hsfue35uUbT3IWkOpl7uOT1HRbXkJDPJ6fZZs1wLbdAuJsQl0El
         bMUw==
X-Gm-Message-State: AFuF++nkPhSmyrwo9Voor5wTtbEg6mlKd+Pmvx3jBsBWtwWrVTKpHLWF
	VBYZ/MYVhX97dUMAJ9tpJAf7uH+9rVcIPUyvRIZbL67YSvuPo14kw/ZiDIqPBDPKEEPWocI49yL
	UYTQWaQDhoVzAzPjpUfX+EVdy3MgYxGI=
X-Gm-Gg: AYBFou2oy9eLBYiZE9AHlYcAmuMdpUGOoko1l2+3x/yvhNSHcYBadkdmeOxf9e7/Gdy
	8LdByfjcQsAPqS2fraYw5RysUk53RUFOcZDMLqwfL1UFn1ExJhxFBiIQy4vQgKB4SLhfYgufspF
	nDq7I3jD5opde7rc+jUY7MfWjmb/yxttCgrxPY/LEQodUuZZSag/rluh2tDmMMBf5PjWt4ypM44
	mJBTk4KyA7qXMAqpp5ciXxaIG1XPYAZJN8USU73r1TrGiW6S0Yhl4D+ORNkT+CpKtn+uPliYFOM
	1wTNY01sXIzwq91zype8bXtIYwTLnpL/R9XhmB+rdUSIN+FJJjr9c0WqrEHR9h1FP464FLwB7zw
	kfV4=
X-Received: by 2002:a05:6402:44d7:b0:6a6:4c0:9623 with SMTP id
 4fb4d7f45d1cf-6a60d3b86f6mr11492245a12.15.1788152312725; Sun, 30 Aug 2026
 21:58:32 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 06:58:32 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 06:58:32 +0200
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202608302349.AXJE2LxU-lkp@intel.com>
References: <202608302349.AXJE2LxU-lkp@intel.com>
Date: Mon, 31 Aug 2026 06:58:32 +0200
X-Gm-Features: AcwNN1VkdzOM8uGfEyH68KT0UP935mXLMHt9ZMFJ-XqrWHgjuysVSl9HBjxMZI0
Message-ID: <CAH=xXfFCoso90bDSxFv6h2W62D0eEsjF4nQWw5R=3D28z7eGvQ@mail.gmail.com>
Subject: Re: [chao:feature/subpage 9/10] file.c:undefined reference to `__divdi3'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for the report.

This is fixed by using F2FS_BLK_ALIGN(sbi, end_addr) instead of
DIV_ROUND_UP(end_addr, F2FS_BLKSIZE(sbi)). F2FS_BLK_ALIGN() uses
DIV_ROUND_UP_ULL()/do_div() and avoids a runtime 64-bit division on
32-bit architectures.

I folded the fix into "f2fs: parameterize block size and mask macros".
A W=1 SH build with the reported randconfig now passes, and
fs/f2fs/file.o no longer references __divdi3.

Thanks,
Kelvin
