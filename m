Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C43D361974
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157952; cv=none; b=NwQAqAwaupdgNHbhRIb8CmXWB7QmfOeaGOxoUzgq6SrZpQzR22laNDbI8ETFUFEnYc4/Y7XIdDG/XT63fiBfKTQ2LQdxzT4ctMc8JXw7ptlQSlewGI/pKxAuwkKlDNPm5+jwOEw1IhW4KTKUh875K83tgE1nJab4L+IhS5EofRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157952; c=relaxed/simple;
	bh=IFHYnNP+SckyeUyQLEmmYcQVb4sBKTTpTCKA01OdQTI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=psBueC31ZAc/86dpBENE+2bo0FzvSXxLNqWos7ax+AN+qUeIf009LbhErqoMHAdhmw6h1YkZb6gNZF5/NPH1aqRvOM+wb40bcCPUPz1o/+gCX9jbEf2LGR/QeEOmIR7lGIJxFiEh+mAJorKn8G8nLvaCvTKJkWqEwV4DuvQP/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LWIORWPl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LWIORWPl"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f6609c657so593258f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787157949; x=1787762749; darn=lists.linux.dev;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sABbElnXmEhSTEIWbpVyplbzPDLUNP+ZueRt21RD7UE=;
        b=LWIORWPl7VfApfcIIntViERUB6ZHtRHE+E1Kewk6RK9TlBOFhVhXkia3rQwxkNLAHF
         f2xi0QMNiargjiPpmtTlggnaGGhbxMW0t00d0T1JnbpTdjGNt3XaTG1+sJiLRel+GK4i
         pO4p6m/RaCMD1fSkb+0WdY0SW2Eh//DQCb4xiSkfkM/d9DqJb0tZe7xHRM98JudX/y68
         6K+AaBBcu28KylumjSq5Vnm+S773Bvcptj65ckV5IGGwU+7ISOgK91iFRQG4WY1Yaa7X
         fnyogPJZq3VCoKI9vj/v6uVaN01d+EB8A95WStjkIgH/CsWd6ZH33lgT0nAio8aIp2Up
         3h2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157949; x=1787762749;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sABbElnXmEhSTEIWbpVyplbzPDLUNP+ZueRt21RD7UE=;
        b=Okf1os/FLb6xAkBG7Su1ZNloQkYKPC2gahI8itp1O83ozwsDn3g7dShI0IWc4eYDfe
         Uq+F7hzyJSc2VAQDUVeQHPdIL3qgqT10g7E6G8hpT6FcemMyQBHF4rJYBBH/9P84mrfa
         1VqXt4VqN0XXBTuvAhPObcQx1gjKA/bmO8pp2+8f96VokcyrJZFTaTJn/hOwV0gAMABr
         o8yqCCthzbzYnzgIzSdPR0LuALVoaabPV30njniuqmwNtjaPiJbKKG6PpfDKlQcG1Ip2
         B/zmSo3KMxm/yK0GdLgPdxXFla6ISKXoCOVoQN08yQYPQQUftLTcY+zrwCuQwHQuoFtD
         OmkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGMuVGQ4G3ds6KulJxt0vk7mLp1i+TiPah1QyoZI971nEXQFc6AKb9zoQIG5IyjFGAJTCF4LsY56tJIIWq@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc7y28GzCiSeH2+nI3M2SK3bvq+AG1YGbRT9Bx6er0a8POPXMD
	huDIIPYKWq3i1/HELfUfI2m2FG29CuB/A4hpyhIw/7CwgUkAk1WY5ihdIUpas9TLGmk=
X-Gm-Gg: AR+sD1048kANdOcLabbXPsGUYZW62kV7nXKl1vl1UdK6N4dLQqR8o4fb3704uPy5Kbt
	B6P1OIYnqKL6A4SQNn1eAr8aT4erMP8GLjNeSuDij7K7W15N6+af5fiowi0nh9NLjkf/9WmBkwW
	hG1h57uN+7ZApT2rh+FI0AYypJD9WszTQCQUysjJHnT4LAM0cWRdY8WYdhRyA1anUMucRKTh+/l
	VBWRSDKrqXnKm6umbHAycvmgIQeEVgEUGw3cZNdTLwf6zjWdWHYdA64yyKS8WC17M74e75rir1N
	SKLufvIsl9FoYyG6RZEPoeeueXmWOrp+oj44fEiQI9CjtXXpkBS+c0UFVHt523Et4ojC/E4Afi9
	PuXw/RunlJjQzMTWdyV/Lil5tt04+dwpD+D0riLlA8AuP5jizaYCqcKU7Y+zTUmny1T/8LKkEUH
	7jstIvG7yPo9m41N/KcC7b6md82w21N6RNGb+OAOUQP6rXzZFv/A==
X-Received: by 2002:a05:600c:a05:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-499aa1b6a02mr100283755e9.10.1787157949274;
        Wed, 19 Aug 2026 09:45:49 -0700 (PDT)
Received: from suse.com ([2a07:de40:b240:3:dd0d:de41:dd0d:de41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0dd3c9sm73283445e9.12.2026.08.19.09.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:45:48 -0700 (PDT)
Date: Wed, 19 Aug 2026 18:45:48 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.com>
To: kernel test robot <lkp@intel.com>
cc: Michael Bommarito <michael.bommarito@gmail.com>, 
    oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 10759/15982] ld.lld: error: undefined symbol:
 kunit_mem_assert_format
In-Reply-To: <52q8853s-5r61-p770-0pq8-770588pq4956@xreary.bet>
Message-ID: <s6r47sn1-pr1p-8s7r-o164-q27s2o40p9r1@fhfr.pbz>
References: <202608190536.d9qCkWWc-lkp@intel.com> <52q8853s-5r61-p770-0pq8-770588pq4956@xreary.bet>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git e6664f2b33db9b6811eb4cec109f06cb2b4f458d

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index aa7fa11a0197..1f294064515c 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1253,7 +1253,7 @@ config HID_HYPERV_MOUSE
 
 config HID_HYPERV_MOUSE_KUNIT_TEST
 	bool "KUnit tests for Hyper-V mouse driver" if !KUNIT_ALL_TESTS
-	depends on KUNIT && HID_HYPERV_MOUSE
+	depends on KUNIT && (HID_HYPERV_MOUSE = KUNIT || KUNIT = y)
 	default KUNIT_ALL_TESTS
 	help
 	  Builds unit tests for the Hyper-V synthetic HID driver.

-- 
Jiri Kosina
Senior Director, SUSE Labs
