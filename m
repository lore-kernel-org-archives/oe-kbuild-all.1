Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEEF32F764
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 18:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769105737; cv=pass; b=RFKdTjQYbSUeDHTieKMljbc2B8xvX8e7hlzO+mBEhqTFBfgFtc3BV+WAAHRicNC+sEClBRqaw6Ed7ipWuEqCcdz400vLNBG9LdvTJqmxHVd2aRNct/eyZxdvJhOckls6J3GRf5j0tFpTHep8usWSa+or+33v2KZ3QBOPHGjRAtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769105737; c=relaxed/simple;
	bh=PmHPMv+0IVVZWQVR8YcLFHLTKICYt5ZaBTe7s/+0FW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsV+eyi6jzq2vaHoHB9EtTB+N3Im1qYEcNaUE20DpsxGerwKVPsA1CZrNZvAizeTVYmi3pHPGTmA5b7kNT0Nfn5Qa6Pob0WK5g3k+pPFP5xNxqHwQkap7kH8o2FLN04AZSqieyU4td2FR3Ky9xpi7s8t9l+hwINUM3l56UgQdkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=DqH2yg53; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DqH2yg53"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65813e3bdaaso1456017a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 10:15:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769105726; cv=none;
        d=google.com; s=arc-20240605;
        b=SAZ1XQz9eFEBOi8OoHFvS2Obuy/rCY9TBBP1NBRWWHc5Wg1A0N2eHy7moR33VpqFos
         AkXSXEKhWHe1OHajNrwxgIUvYEbtdvza8R3QjZhqLp8rrXWCbGtde/X045vvXG9WRzHz
         wYrgcUdfXr/2XqEzreVxXKSTX+fqRLEjHw8rfva7xx/Yy6LM1DbnlLQmkDrYWcuspcCV
         +b/9jDFPyJWMmr+HbEGLvocfk3qxJcAoTHjsvj5PxT1jDFyg4yt4S631ZdZjV7/5eSTZ
         vDtVuyeKSKh3UbSFWfFbIcoCZH/zGAL1hLBA2FhnsctxrdDSJI4CwgqkSfIRyeXRBMvg
         eT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=azOk63yV7A5TybPiH/Lg4nzY0I8Pa0E2B+WL4X7922E=;
        fh=sRrIqPeaKy8DVG0lOFhpke4hOTxIzX/4WBxNSJlf1Q0=;
        b=dGB2bZkifbTGMA0RhZYqkSD5pIzYo3UBC7v/HGunp1oS13htjttYlmSWeVN5jdIVmf
         zNjk1hUV74CWWWggOt9ji1+VY5WzjUqCjw42iseYbDcKe6wK/wTMxMi5dGCKoPZaDGF2
         xuAojaFcoc0Leu+Ur2qh2njLBlNJpBfSnc7POOGiBjs8TNwQx5w/Lfb0U5wnlyzoyWAt
         4haXfBH91jm3ts2TUmp0NZdZWvS2J676lJCDlS64erudYzkZ742JIbQgU6WajjK9e07y
         afsImCs5HQpHn+kjQqTuqbkTZmQSoxNZApzhUT3pxx9flVRxJ7Raq5GONX3+siSHihT0
         hbBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1769105726; x=1769710526; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=azOk63yV7A5TybPiH/Lg4nzY0I8Pa0E2B+WL4X7922E=;
        b=DqH2yg53WCqWwIf3Rz+kGtgrquFFztfom0WtzBZQWxEGwAL/gGD+49n93AhBHveGmL
         UZ/XIlVM4urLyxeXemAKnMxerLZtnkKiXszSOfwVjTzbE2EYNkRrtB+Kf/yITvkNOprB
         OKZPtn4HysdmD/rup2NyyvSkBjvMW8UIXNwuSMT5hHn3XpxrmKKq1IoIXDhXFXG0LqOG
         0albPvIJwVkQiSRGJqHMsSGUSp2EnH7s82GfBnyBxGcVWdbH/iWn2GVWfzdZ60C3ur0r
         sVxEtmhh8e4Y76fxzZQ08g+gzKm2sp8APHopJXF5BcOovofSw4CfxVMkaqd2U+WWoCZ4
         9rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769105726; x=1769710526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azOk63yV7A5TybPiH/Lg4nzY0I8Pa0E2B+WL4X7922E=;
        b=xIkd+WwMa+F87g6Y8aPOBM1PFksU62q93MDD08oaCeVj/o5gurG1TzpODYm1pk+fsL
         3CUcMeI57+DIBwMpZKqiai2DZGo5otG123vKbYi25PVJHK4jS+DLDTjvlaiZ4+SNzs1c
         kmJMTkdIdRvZK1KK/jIhgmwY2mVf7BMRfL/PsMq/irZ2XibTxkLxazWmw3o+3BLvPgCw
         6YEykavoX7+kv9weTL6oJ3WE/cT6iPRQdbRiP/H6LZSAhAhg157SiVVj9lF1Lre9SlSi
         UxVEOCvwRKjd/WivrPRbzy/vtOxqwNPbiqg5cVQRZ736nHAftzSxSCVY1eLTaaMH2M68
         8WXg==
X-Forwarded-Encrypted: i=1; AJvYcCXHuYh6Y2+AqB+wU/rIQdk+G1SlGqqjbq69VXNJmY/Db4v8HQ+/b9d5xdBUFUi6jY16XdP5DURizvZLb7hp@lists.linux.dev
X-Gm-Message-State: AOJu0YwfvX4904F3oljroRG0biPrWSpnc/6gr18sQ/IrApspggc1ymt4
	iYV0P006vKMgsdkIoxFRCpMB6fOSt1JTU1qI6j5u0KFTAR/pwhRgZPY1A8XX90K6ak3wIhy7bAO
	aAH3HZa0HruY0TToHXBY39Liq8GdOTg59xN03FIYDCw==
X-Gm-Gg: AZuq6aLPfliKRlD65KG6j/ECd9ksU/tEY3E/O449wnPP16pW1tKt7ZadNDbzsX77Oom
	Z8ejVlXreQR6ftNwLH8jfmhrZMo5mHQAx03HqpuZbT5re7HSGp2yNb4/7bUbbyRdkDWBk9JxIr3
	VmHWmYcALBy/U7zgOOxZnz/r4nmmFt4ZnKci+ehIz3jWbWio0zD9iSnzBwKTDCx14RwCLBMphy+
	6/juENX/arNYOTRlr3umgR+DC2T/qvqNuVSC+THbronO1LHCjqJZLZKhfLD8GofxxwsEPKRNxHr
	TGleKLY+LzhiAsyBDZ33yXBQWQ==
X-Received: by 2002:aa7:db50:0:b0:658:1350:1fd2 with SMTP id
 4fb4d7f45d1cf-65832eb76a5mr1835496a12.13.1769105726405; Thu, 22 Jan 2026
 10:15:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601211636.IRaejjdw-lkp@intel.com> <20260121123922.c0bb0ef8505c70b99998c324@linux-foundation.org>
In-Reply-To: <20260121123922.c0bb0ef8505c70b99998c324@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Jan 2026 13:14:49 -0500
X-Gm-Features: AZwV_QjkOt8rryPZqYSqx98LQ60wO70s9K8cucBSZwSM5UYoS1ViJ13uHLsVIOo
Message-ID: <CA+CK2bAyHHoUaT_4dTNK6AH2oyMMhs2sNhuW97hV4yRw7ie9Tg@mail.gmail.com>
Subject: Re: kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc()
 warn: missing error code 'err'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> --- a/kernel/liveupdate/kexec_handover.c~a
> +++ a/kernel/liveupdate/kexec_handover.c
> @@ -1011,8 +1011,10 @@ int kho_preserve_vmalloc(void *ptr, stru
>                 chunk->phys[idx++] = phys;
>                 if (idx == ARRAY_SIZE(chunk->phys)) {
>                         chunk = new_vmalloc_chunk(chunk);
> -                       if (!chunk)
> +                       if (!chunk) {
> +                               err = -ENOMEM;
>                                 goto err_free;
> +                       }

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Thank you,
Pasha
