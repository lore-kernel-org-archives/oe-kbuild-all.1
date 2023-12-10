Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28151CA9B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 23:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEx4Bi7b"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c41df5577so9045545e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 15:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702250232; x=1702855032; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUOVxl4HpYU1bx6rj2b0A+tzSIzZa3SRymZBrwldX4g=;
        b=OEx4Bi7b3AENnZ27/XRZx9QUm0uk6sugY9mh6EhMrFwlIXX2wMOW+BIEmTlHpjZpct
         XxRtg24peSH5w3Jd1SxtaAsSus7tPbg2bShGwPnHfx2eOV4fsRc8T7X8B84ENNn6+Qdh
         KXwhllhr8LPfkRS5BLfyqjvPrgW9dUKtL/pUe+EXHcjNKOnqVsQIY/t0bEzmo2LUzzBJ
         6HMQOWhroLtKaHbyGtkEqJmhOmqgSf5MhtxJZGM8INM7DFfGwq47ezMRQO7z9IlyYKag
         V2mvtDKJZtaP1HNllnpjJ98cLSVm52pMRnJOgJAhMpY1JsXpmCggx5dHYTcXCYXVFaX/
         33jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702250232; x=1702855032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUOVxl4HpYU1bx6rj2b0A+tzSIzZa3SRymZBrwldX4g=;
        b=jLCh52YJUSuj9wUd/4klRi1oURu6XNhN9ACZN1nYVBreNOjy3bp+8Kr+XK6aP9ZUfl
         982/zQX1ArzksX8pFZnI/CG6aS6kXzFzgOvDOHwgHcEKlVXeSjC6kf1K53oMuBwbwU0L
         t487qbndsGsXQlpLqaEMFBw0xfUzQHkF1NryhSIGFg395UOPd7yxeNffwhW0QVwFA3Xb
         ReCEMYEZKIRy8vIS6cLjoAHzWVMVsNbtHi4q8rcIDW+dVW3rXB4rbOQd7XQ3cIRvm0Vy
         0kIIfrvSc4PMr5B/T0F3gSBLVbVr5dUfnYwhEFwUG5UZ1BKj1zbcld/n0Vz9CyVxFH4G
         ZU5w==
X-Gm-Message-State: AOJu0YzDG4Wc4qjKqcUNXhvEgL3Tsx+Nto6GT0KTnzwF1EOE+Pp/n11Z
	xicX9vIdwtcRpIXVE6wFbGA=
X-Google-Smtp-Source: AGHT+IEY9i/sDXCzfd2xco9ERUinyzejQ/kbwdkP72SFHHU0dF54VZewAHnol/SgMdHUX+k11vcRfQ==
X-Received: by 2002:a05:600c:158c:b0:40c:2597:1e63 with SMTP id r12-20020a05600c158c00b0040c25971e63mr913012wmf.102.1702250231594;
        Sun, 10 Dec 2023 15:17:11 -0800 (PST)
Received: from [192.168.8.100] ([85.255.234.101])
        by smtp.gmail.com with ESMTPSA id f5-20020a1c6a05000000b00405c33a9a12sm2367089wmc.0.2023.12.10.15.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 15:17:11 -0800 (PST)
Message-ID: <18a68cf6-7738-40aa-869b-401bb08bc41a@gmail.com>
Date: Sun, 10 Dec 2023 23:15:50 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [isilence:zc/rx-pp-provider 5/31] net/core/dev.c:2065: undefined
 reference to `gen_pool_for_each_chunk'
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <202312102313.zJHWVLAZ-lkp@intel.com>
 <182d28da-8822-4d2d-85fe-5a1843905eb1@gmail.com>
 <CAHS8izMn0JhRkmvF1yEvk1iUdYmHNbxbs8GgO=0GX6Qq5uR80w@mail.gmail.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izMn0JhRkmvF1yEvk1iUdYmHNbxbs8GgO=0GX6Qq5uR80w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/23 21:05, Mina Almasry wrote:
> On Sun, Dec 10, 2023 at 8:54 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> On 12/10/23 15:45, kernel test robot wrote:
>>> tree:   https://github.com/isilence/linux zc/rx-pp-provider
>>> head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
>>> commit: 161f99ad49ca48fa141161b409eac11a6b63c105 [5/31] netdev: support binding dma-buf to netdevice
>>> config: i386-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/config)
>>> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/reproduce)
>>
>> Ergh, I have no clue, why lkp thinks that it's a good idea to spam
>> about someone's non-release repos, but just ignore it.
>>
> 
> How do i enable this on my repos? I have branches on github I'd like
> reports for:

That happened long time ago without my knowledge, but apparently
you can just ask them

https://github.com/intel/lkp-tests/wiki/LKP-FAQ#how-to-request-testing-a-new-kernel-tree-on-lkp

I'm not aware if they have filters for what branches to test

-- 
Pavel Begunkov
