Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6611512B9C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 10:47:00 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31297125334so3802482f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687862818; x=1690454818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6xOLnDH1Xwqy0BlkVwmkMEhS7CVJz8R31Fj2eZ8B0o=;
        b=uQ86zJvyZynE9HZPVEeB1dCmY2rg/Yb3BXZtw60CvMg6c8G/xc21cG4ehkmhwTwhZp
         0qriGEFye2YRsW2T+fNX+70Lfw4D6oFCOtX4OiTMYLYW7rFdF7dfmHqgujkAL1lDZzE/
         6uMFID+BJcg4AEgDhQI+513Yr6X9TAfpiF+truzz94kqMc5f16Dr2THzDpRC93wsPt/S
         4riRP5JWrb07H5Nw8exEpAS/pG0TVC7KDG97R+n6H+yYQsUn7riil5JVVbNC0k3yVQdN
         wgp1fttn88FxSVwuNn22hfZv4HpBvgvXve9Xkaq93f0eFJ8rW02iodm2Cq7fe/G0IR4k
         H7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687862818; x=1690454818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6xOLnDH1Xwqy0BlkVwmkMEhS7CVJz8R31Fj2eZ8B0o=;
        b=a9TirKvIVWhxRCcK3I7utYBGQwddkKVyfxSkS7xzByBBjPd3YycyEb+OP1JFDT+L8d
         ZDWQQWW+PZyn9Xpv0luuQ1rYRVHLWd9Y3hhjXdY0if4ujLEvsyC8H7JGJTzcRsTPbOgG
         qUwqSxVzEND9n1uGSJjTeh3FO78ZzL3vDG2zgC9wOh+7wxtMqr+QagWJKsdiITpq9/Md
         zlTZ6aJ4H+wGi9HQoEVyaTzDZRH0cfKIhFl82nS/+VaZngSaAVscCPqpk9hkKYeCdWaQ
         KfeFO00HXlPhHxpbB1tMKp/u3/nHT3QApC/ouNbZX/rDcOqFT87qYsWOJzifCypf6+zx
         acEw==
X-Gm-Message-State: AC+VfDwYwbwL1kNAWeTIo6ccQdbICJVG/P9fZn54NX/Jf0zRc1CVv9mV
	aINm1vNQUR+zgG3dLSGYJ4MjPQ==
X-Google-Smtp-Source: ACHHUZ4uEsh+WEqfxAguz/OPv0GnfpxWzzgy6xgJmKCLRmU00jQORKGZv/vH7477ZYyTvxhkJoh85w==
X-Received: by 2002:adf:eb02:0:b0:310:faf6:1922 with SMTP id s2-20020adfeb02000000b00310faf61922mr33363822wrn.7.1687862818439;
        Tue, 27 Jun 2023 03:46:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a5-20020a5d5705000000b00313f9a0c521sm2437529wrv.107.2023.06.27.03.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 03:46:56 -0700 (PDT)
Date: Tue, 27 Jun 2023 13:46:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 22/24] Input: bcm-keypad - Simplify with
 dev_err_probe()
Message-ID: <92a1d239-4da0-4f92-b3d8-8c2239df9950@kadam.mountain>
References: <3b63bde3-797e-4d58-92a7-c77c953f17d6@kadam.mountain>
 <d5e3a542-3456-293e-8ea8-112eb8cff7cd@kernel.org>
 <8d3ff4b2-8f43-428a-9cb1-9f939f64636b@kadam.mountain>
 <e54c7b49-6d61-9de4-3cc5-4915fc800247@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e54c7b49-6d61-9de4-3cc5-4915fc800247@kernel.org>

On Tue, Jun 27, 2023 at 12:35:24PM +0200, Krzysztof Kozlowski wrote:
> $ x8664_cc make C=1 CHECK="~/dev/3rdparty/smatch/smatch" -j8  drivers/input/keyboard/
> make[1]: Entering directory '/home/krzk/dev/linux/linux/out'
>   GEN     Makefile
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CALL    ../scripts/checksyscalls.sh
>   CC      drivers/input/keyboard/bcm-keypad.o
>   CHECK   ../drivers/input/keyboard/bcm-keypad.c
>   AR      drivers/input/keyboard/built-in.a
> make[1]: Leaving directory '/home/krzk/dev/linux/linux/out'
> 
> Does the C=1/CHECK method differs from kchecker?

Ah...  Yes.  You need to add a -p=kernel to enable the kernel specific
checkes.  I wonder there is some way I could automatically enable that
if I detect you're in a linux kernel directory?

x8664_cc make C=1 CHECK="~/dev/3rdparty/smatch/smatch -p=kernel" -j8 drivers/input/keyboard/

regards,
dan carpenter

