Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E973E38DC79
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975449; cv=none; b=qvbCSclBrLScvWXTI0Xq39MxPmJAgCRThyCts37s2NHrbvvKRux+78Eq+jAAmnLSAj4rN7WkaFa9dSmVOovsuOMJFIlJ3Dq+4O8o9W53yJ7/IsSIQCMKjfaq7hNoA80nPgxzChi3721MXMfEwLGmNi2+nv7CQhnM5hsqHuhlmhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975449; c=relaxed/simple;
	bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
	h=MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:From:
	 To:Cc:Content-Type; b=VBjm7Y9hT8DO+WkExgojFSvm0n7k4awlEscIYiUrCq7R2jrkZbpYsdn7aosWN1ywWrLupHUNFnPXg2G/MvzlmRRSVfLCagmsFo7K53HkHBdq7JEgJvNlgdvLrFnJyBAF7RJs/9su9dLYksKrpxVetMWALlfSGb8PhOZBtFu810g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y+tidQUJ; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+tidQUJ"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so84272a91.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 09 Sep 2026 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788975447; x=1789580247; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
        b=Y+tidQUJ9GNeNAB0gnZ003tHI53Do65NGD5lZt5OknSd2GsX+DTjHDdjTyc29O8brk
         eFHqvQdEPBoW3XoLNlH63l2fawKJe+Cvl1eVMn+Zj3Ym60n/KfZ5ykYk7PpYR4qYKL9U
         kzVgZ+Xv2NMhltQ6R3imfGv02DmwYDMU9jx7cvPL7zdta9poEAxu0FVxQ069vOjOCSjc
         SIWT0gQGRdHthiGbm6YGJT84Ip/57UXhq94aeimVpaTpIuOWFCempEKZiYQ9Bt+/Jkok
         ApaqJgntYSMJZJMvjP3X/5WmcmKAWdE23M/gmP7/f/cUbLLnmvmXp6IrcRSLjVMedj8a
         5fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975447; x=1789580247;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
        b=iM4fdPNko7NBFkvWUd1/8f6j9ZzYuOPG6/VFDz+mLwhgJ66JbpnFmYbcuwaoISdria
         V2DEfaY8Dgdgfo/d5w9+VyTHpTYbtFN4adgY57oT02YEWu7Y2JPEqr2KVVyMWSB22+YL
         gL4hp1pGPgpTUGk8wVD0Z9IWh1b+n6LrgXTIm84s11napcgTYGgPzSDD9MAQ/SFDCfzf
         sp/zqu+qY42AkVLVcAXdul5VvqSj8MIP0/MJ/JrSDt8XLXe8YGJedIO5laS0g3UQHEcq
         Z9cti2FVcbmQtKakhu9yP6G90LQFQZIgQNCOkVxnee+dQto3/mcDeJ0jyPoApdUonTxo
         gi5g==
X-Forwarded-Encrypted: i=1; AKwUvBwQv8yrkXrDPPyEo54wsuzBJ+GsOHOH4iqNNSxv2ibLyurwKQ9JGA7rykYjTQk22g2cQNA6Txir2f8IgIYb@lists.linux.dev
X-Gm-Message-State: AFuF++mgl5GCaKUMOQuKJHboR2h6vM3ZucEC0XqFvGUiNOMesS8P8z25
	XFJjL6PueFo3DJ1UdoyNiQj0FbAZRIX56ELQyFeYr4jN6KmI17x4fwmWMKrrUyE2DkG1AUxxNK+
	8MGcLw3D73QBfF1+UChXZfF1VeLqYad3JHA==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: from pjbpm12.prod.google.com ([2002:a17:90b:3c4c:b0:396:702b:655e])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:37cf:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39d77aa1851mr284135a91.8.1788975447027;
 Wed, 09 Sep 2026 10:37:27 -0700 (PDT)
In-Reply-To: <202608260405.gHL6gOJf-lkp@intel.com>
References: <20260824-pcie-lmt-v6-1-bab4ce233fa5@google.com> <202608260405.gHL6gOJf-lkp@intel.com>
Message-ID: <18d3b7b0cfb6fcb1.3137322e31392e39302e313337.965f0.0000sendgmr@google.com>
Date: Wed, 09 Sep 2026 17:37:27 +0000
Subject: Re: [PATCH v6] PCI/pcie: Add PCIe Lane Margining at Receiver (LMR) support
From: Priyank Rathod <rathodpriyank@google.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <helgaas@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-kselftest@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the report!

This series has since been decomposed and restructured into a 3-patch stack,
and this issue was already resolved in the v3 submission:
https://lore.kernel.org/r/20260904-pcie-link-endpoints-v3-0-4b9a91bd4b35@google.com

Thanks,
Priyank
