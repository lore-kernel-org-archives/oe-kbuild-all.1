Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5F03128D4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774784668; cv=none; b=HjG9s0x4ey85erGxCiD8FZVKEPtGHnCSbwrbDcFJe0NBkBW0Cr+nfu3833Tc1RMhsNa1zS3fJQyOBnSe/8sf9H/g5+4SFMvpJCM3SMB9rYEIhsIBHJEb15G/Qf8/dtFCHJwm92ec8i5boZ75RBRg1i3+vM2B7oGHyMd1aMEq/jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774784668; c=relaxed/simple;
	bh=lkgcc4CtMjk1bN0zjQdR/f0eplRuaa0CikSDA4RfA5I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjmAO9j989dZYYOq7koYQumItJM+cLHWEqjLMJLqzSENI2staHxeyzvMeIVuPOSPTJvdKwfoRTBtJZD/ZhzBosjSTWeySQoqjDPVyl/Ge9V3AmYILRN6p9CdEbDe86g/sB3drmaIAUDi+RuSR1oxbN/9BIVw4I09HSI6f7ZanpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaRPztiT; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaRPztiT"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so377579a91.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 04:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774784665; x=1775389465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Csdueb260dLL4KAw0AfvdDf024yqqfeIAyjh7nn3RU=;
        b=GaRPztiTjmuwtYLH9xvQe3bgoXrNln6Q64dlb008rrTw0U+OcUvBf0Zz1kCGEsl3YP
         CqSW/5+H7JScqg1yTRaocbuULMJpnK+goumYJRwEFAElPuXJSvC5NK8LMQ4E1iMeZ1pI
         lpiLoR40d3UhUrLlF1AzJqdhANP5rCClFIBJl2LpTNI/olaeiqXnuc8GUxRsq/KCFdvA
         6n+fKiv5vPXA1Iif3fx7bujPWkLcDB8KPVtozMdu04ENzuvFe+HgutuvXwZCiD6j6Si4
         8NMvj8jEpSajShHAY61thbAcOpiAGvuLE78GX0ptWtICWWikQ7O+QyTe8vCqlHLWvLoJ
         YzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774784665; x=1775389465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Csdueb260dLL4KAw0AfvdDf024yqqfeIAyjh7nn3RU=;
        b=dl3bfPQuxfa/9DfQ6qOd0ApW8To/vg9nx7CDC+pMkBkGw/wbqhH8LumSgWgNDseIU4
         NjwXb4c5Tn5JiWI6bqxsISfx2Zs2NRMjtYocrS03jShf/5NK45FYdPIyu6ZxvuStlie2
         zaZBcDhApFV8kwldJ0xzDY257Ouem9dRxUZAX72RR0rsAM73xRv5a+FIzyD4/l+AfQxn
         ound6gifwhO8y8PKQGLTmwBX+RAzh3/nXy8Vit6Ft7YMq3Dxpd7/P0dCe2ThLQhXGGj5
         slEi0UyhnH9JueLs8942vqFLW2GjQTQkNEmGDYNh9qdBxXfqgbxMbFv3x9kAqW2jSzAj
         L7FA==
X-Forwarded-Encrypted: i=1; AJvYcCU9dzp+/xCI7vpRQiko3cbBGUdpcR8Fl9K1D8qUXm/863aQFpTGzwvwoTVh2r3H24Bw0h2DocjmftiD3cPJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzTPXrppjTK88HveNAB2T8XVXCQvx69wgdY0up15s4txL1mTkJb
	4VG+IKkZQCljS1SJGUwiDk7Ztb43+Fk/b7rCTMZ4wkabPDiePz72plQi
X-Gm-Gg: ATEYQzyMNY7NSM58PL3jR57hnWzqRTStCjwacF49/vckaUvz4X8DqEKxd00kyAjbG3L
	BzV7xNQfk7zKdSE+zNx48O9l7JIP5K12XrjAn+w1PBEmj5FjmQKWoQwXFxWjmR9DrLGJKO/SVnZ
	mWhNTQOZnTmr4aD6GUFVCTZLlgj0DRNkOB9X6Ax0mcm9rs+t+M0/6xv16hTotH+jhn5bZclfN/i
	pAX5g5yvtXwzFCoelKQfeqAd3qjcTmB43vU3ar8pvvPf3n04AoroiAOP7y8TskLXognuHpKHztu
	HTywzBwEb7yEWg9T+E2TOqymxqcjzdEew5B3vbcl3MHm+BFFI/tn6Ye4spDu8+UqQRkKCQAB314
	6QTTaaYxy7evlxZFmRkXaW2O+zOBUAHKGv/POHbU4VlGrJGMGJ7gyB/oSC8F/geKfEtFFDa3J6G
	gdndvlmzfTMUIM8lT33ht+Buc4mT3RRrk3uXbm+vVF67UTVT7sUACUTPM2oZriO2N/p1gPdWaBe
	Rs1aA==
X-Received: by 2002:a17:90b:1e51:b0:35b:e4f8:7b3c with SMTP id 98e67ed59e1d1-35c2fffe870mr8867503a91.11.1774784664489;
        Sun, 29 Mar 2026 04:44:24 -0700 (PDT)
Received: from localhost.localdomain ([188.253.126.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2d7df071sm3174591a91.0.2026.03.29.04.44.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 29 Mar 2026 04:44:23 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	bhe@redhat.com,
	chrisl@kernel.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	nphamcs@gmail.com,
	oe-kbuild-all@lists.linux.dev,
	shikemeng@huaweicloud.com,
	youngjun.park@lge.com
Subject: Re: [PATCH v2 2/3] mm/swap: use swap_ops to register swap device's methods
Date: Sun, 29 Mar 2026 19:44:18 +0800
Message-Id: <20260329114418.39732-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <202603291844.TWh2Ellp-lkp@intel.com>
References: <202603291844.TWh2Ellp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, Mar 29, 2026 at 6:49 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Barry,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-swap-rename-mm-page_io-c-to-mm-swap_io-c/20260328-170852
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260328075812.11060-3-21cnbao%40gmail.com
> patch subject: [PATCH v2 2/3] mm/swap: use swap_ops to register swap device's methods
> config: arm-randconfig-001-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291844.TWh2Ellp-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291844.TWh2Ellp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603291844.TWh2Ellp-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/zswap.c:1057:19: error: use of undeclared identifier 'sis'; did you mean 'si'?
>     1057 |         VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
>          |                          ^~~
>          |                          si
>    include/linux/mmdebug.h:133:52: note: expanded from macro 'VM_WARN_ON_ONCE'
>      133 | #define VM_WARN_ON_ONCE(cond) BUILD_BUG_ON_INVALID(cond)
>          |                                                    ^~~~
>    include/linux/build_bug.h:30:63: note: expanded from macro 'BUILD_BUG_ON_INVALID'
>       30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
>          |                                                               ^
>    mm/zswap.c:995:27: note: 'si' declared here
>      995 |         struct swap_info_struct *si;
>          |                                  ^
>    mm/zswap.c:1057:32: error: use of undeclared identifier 'sis'; did you mean 'si'?
>     1057 |         VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
>          |                                       ^~~
>          |                                       si

Deeply sorry for the last-minute edit—I fat-fingered it.
It should be si, not sis. My sincere apologies.

diff --git a/mm/zswap.c b/mm/zswap.c
index 9bacb1733e1c..b60821758169 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1054,7 +1054,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	folio_set_reclaim(folio);
 
 	/* start writeback */
-	VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
+	VM_WARN_ON_ONCE(!si->ops || !si->ops->write_folio);
 	si->ops->write_folio(si, folio, NULL);
 
 out:
-- 
Best Regards
Barry
