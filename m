Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677403;
	b=d6KXq0+fGbfuY01alGGHrlZhUi85r8evGELacyji4qW52JVcXMqBcYmqkovr/n3YXnMF
	 LKjfxt/W4klYTRID4GTVx0YlowN9Z45GEptXuekuLYuUVkfTulf03fhrNjLbYPdiEwJIu
	 FlIn9uvxGaZHSArzjAsu8lsMAlnRfeYCTcRFnS8QF1e29SiakzzwagLLTf4MuEWtSL+Ev
	 xigTh+SqkLdeMt56Wy77dj74kK9oyTL9agdZIGNlJnxN07dgQJmnfGfRn7ujGHtTUkJhw
	 KuK3x3Y0OucQkwF2fF5e1cgdyVFD7+IgXtHqDAiCMDOL6IkvUCzAZ4mGte8K1YfPjpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=2B/4dI4VDUiuBLYef5Gi0z/nywGDePP/HCtFfonWUuI=;
	b=e++LhvX6wflIqfZ2ga+t2SkuoMYKzWciB+jY+WIRc6r8GTwuJXjg5kx1VN30TjHOm/on
	 waVOQbUeCDj/vZYranFaem5CNShf2n/7uOlBz2UMiVeS2uo4RbmMn6WjQEDNW+hP0lj6S
	 +G7oViBQLNRjuBbsOdcyKOFyML1tFJRDFsNwUWhfQFeNItVrlap/FF0gIhcsihZIqDcCy
	 B+L3kHyRN6SipjQA88y3XntYP1GgdZGye0PXEwMdsGSdg8y8d8FGlwEaoPELm3GJNCphl
	 Wz+ZJwNZ54/JpB+Iv7q2N7smuuAnZTLtf2yzPFISWs+5BtKjOssKyLLN5i0A814hROQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FeD6/V6B";
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15580606A32E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 07:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15580606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeD6/V6B
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f02f04a426so54839405ad.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 23:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795677402; x=1796282202; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2B/4dI4VDUiuBLYef5Gi0z/nywGDePP/HCtFfonWUuI=;
        b=FeD6/V6BiuN8kq0CQy9JdfeBHxZacsPpA47jqIPrBZeMiQPoVk9Ame67KstVRJmq6N
         TBfaU8eqHv3s83luS++UurOpJFPbAneSK77MXOAUZgeyAiZPQ8cDrW4q/iX1K6ms+igf
         gaAhlIKjGYsBcpOaOgGCSkOVYaaMCThSJm+ZtTMfYweWPfY1ktg/xV4oopf7FHmhwobi
         +IorCLWWjMSwWlheBiGsNg9aLDNeeTtzKGJdyopLxle88AGXcFVDA9mFjwBR2yYojM3R
         ej6DsrVUZglQ4dOiocqbODbuyVU1cShuvOzssKXGeKSD1q89xTvf7+6E3YpfjjmXdc5D
         NmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677402; x=1796282202;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B/4dI4VDUiuBLYef5Gi0z/nywGDePP/HCtFfonWUuI=;
        b=HVDSodznCjvr35f95RWbrTI9RNBjJVF01WuOXbWuLNJHjhP/+cfxcmNDM9PQRi/UMv
         nN70Y6nu+ABBzI7WYuBE/iKMko4djOsR8Pl3XYQJb1O8Z5m7RBTdRRWTq2s69y3k70M7
         zOgE5WHrj3F4+fm3l63GlfPsZUFr5EC39I28kvGDznsoVIPzFVuJVtfXyYj/APyxm4SZ
         92zzme/H7q1sgP1lko9ZC8/lwZ+6l/vaxSwqbf0LKbmN9AVuU2t2LcexTSK+HitcnCCh
         zljj/t8Li4gNK0pCTeQyjIPPStrr3GW1jtA6E9JrgJ8bRM9w1uvSDLOvrfu2wyGNG41W
         Ieeg==
X-Forwarded-Encrypted: i=1; AL+hErHCEV/3PPK/8pLVrrptm/dWdyiuHeJLVwgqFbh3kmQE4+zujTE/pAXAWOBn02sN274JQ/zzHqU3ZelBNqXg@lists.linux.dev
X-Gm-Message-State: APuU4Z9e+hLQeVYrBI63b3lTeDWgCdrfkNy6JV2PPMHOvAmdqwEIa0E2
	EfBnnKspF8PFXdYuKD3x6orQgr0wyDYT/3o2Jm54FIbcHARcnsIM5eG9
X-Gm-Gg: AZFdTZdYFKwD7/4fu0YMUOaldG9QLWRiqm+rNiy6nlPPSteXeXralJOCSIoce8R7ZYI
	A1Xr/cop9PsEjoH1Y2aMELH6Bjv3j2qvYaqOMgAWizA/zl3javSp3rvaeCzVrsQPGyTkUTZet+K
	7bqMr8jbM3UnuVfRTgCEkmFwRe0/PE7BKeHlPtVtRv0UKaqbuQds1iSMxek4ZH5YGh+ebWUmU1e
	ADZvyxHbXRsHbrqVcr4LoPYPLCvCxEQzxID9A/e2cwNzTl9sOyX6kkxmiYI01VPIgqw0MBo957b
	H6nprfLjPqs32/uxh6qxHfXm1R+7IsoOoCy0bdsNKzjZ+Ue+NQ+pbwTrNjl8BqzMDTpQ6CESxhD
	HcF/RINKHdsFgqPCLsufxfFVkizR6VajNA7DUIKXlcjl9waVSXIWBIRcygy7ezWNS09CkZr8eZW
	neDnYY06NqnMTZFCpMQ4Ngv9pcITdmZaTZWd4ALwZHNTw5/GLtgaf42HjixjATwiQEliu3AYzwT
	8MqtbP8iIWeZU4kV2p8av/aRyt9ttoakE452RpiNs2NafA/z+86FykytDjmjq5FyTPpIEbuNQhj
	fubG2QG3tniFX4J4HUoeWuni4cnzOlfppv9tGAoT4CZkfI9cJ4Gh+VaRlec8ovP6EBNte0OAMHt
	n7mb5XqPapzySgglrgMRMjgY2
X-Received: by 2002:a17:902:d4c2:b0:2f0:8799:415f with SMTP id d9443c01a7336-2f087995606mr144752925ad.44.1795677402208;
        Wed, 25 Nov 2026 23:16:42 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2091sm97624275ad.20.2026.11.25.23.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:16:41 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, oe-kbuild@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: Re: [broonie-regulator:for-7.5 6/6]
 drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq()
 warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines: 444.
Date: Thu, 26 Nov 2026 15:16:37 +0800
Message-ID: <179567739729.2548149.711673218230357357@gmail.com>
In-Reply-To: <20261125184601.R647t8Sj-lkp@intel.com>
References: <20261125184601.R647t8Sj-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Dan,

Thanks for the report.

Keeping the IRQ registered if qcom_labibb_ocp_hw_enable() fails is
intentional. The devm cleanup action, qcom_labibb_stop_works(), is
registered before qcom_labibb_setup_ocp_irq() can request the IRQ. Once
request_threaded_irq() succeeds, ocp_irq_done is set.

If the failure happens during probe, devres runs the cleanup action and
frees the IRQ. If it happens during a later set_ocp() call, keeping the
IRQ registered allows a retry without requesting it again. The cleanup
action still releases it on unbind.

qcom_labibb_setup_ocp_irq() also runs under ocp_lock, while the cleanup
action calls free_irq() after dropping that lock.

I agree that the hardware-enable error handling could be clearer. The
helper clears the interrupt latch before writing INT_EN_SET, and the
caller currently attempts to disable the source if either step fails.
I'll check whether that cleanup would be better handled inside the
helper, taking retries and the existing hardware state into account.

Please let me know if I've missed a path where the cleanup action would
not run.

Thanks,
Yaohan
