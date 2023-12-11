Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39F3D964
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 13:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YI88+Ejm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c2db2ee28so45860935e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 05:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702301201; x=1702906001; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zizH+phd/QONpfEg4sOsv7OA+Htg6eWN3XQZYJmvUw=;
        b=YI88+EjmfWXZmcURSH8arHmnN/8tqHnx+dVcU9su4vsn6AlgJ5woBe01QVDb+vGqGz
         s0Uo/E2pKk54n8eGtLc3uHDkAO/rXKkl8wxEsypOLz3OnVgtA6tNMJ1INe9JFyXhEjTl
         8KjTXUX2x/MiASTmbCGF0jvPzQ3wsWmHVjzb76Taq9wvZeqzJWvKBMJMlTKpWI4qr2mN
         Df5M1hGzwRNFBnyB9Wx+CWQUNMcGF83Sbo2f3DgmTeUZvUpKBsA/a3nBv8VHAAO7lAlO
         nj2U03sdt+8YgYhINmowkgwEipQpOj861EeYCY5SilXg6fmv7s7SzJrCLnxU6BTbMDxB
         QWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702301201; x=1702906001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zizH+phd/QONpfEg4sOsv7OA+Htg6eWN3XQZYJmvUw=;
        b=vUdqWqFqwvLTy8s46k2oVW6jc0HQ/UQ+ndTZ/DGeQt4WoOEM9XgOucT5eqIVw5wWC6
         XKDwlAEiaItTjqGeczTJwHEfjNCwXomdKv0W4Pa44yVyWTNwQVILrDUraPqmRwWPoXfd
         SWoO6k7YmgR91XBJxlp8+y0OPg6uuDdA5Ppp/UromF89X4UwFoTsRCRcjUA4YDHTYdYT
         8/woYEeI+pD3IIqfq1Um6p2SSJ7MR3bK4/6c21E0vroTetA3oCn/EUD4irIjic7zvDYE
         FkJEQugULUMUk9pHdkUN9RmS9b/XfLZLfSOa7XIelUzfycex1rNazZIINLLl9fVNhwCs
         pBbQ==
X-Gm-Message-State: AOJu0YyvxKFeoagRYRAqEEC9qbqWPOy9Z1MSfUitOFJkmstFDFTT3b1l
	nso7I6fIzYEC+2nFa2rginE=
X-Google-Smtp-Source: AGHT+IHRsqbuIz7Tyv3mo47EUk24iwfl0hVYqyJ5XGwKBNrfF6wN6fRn34ikt7LJtC5eJ7U1xgHrtw==
X-Received: by 2002:a05:600c:2311:b0:40c:325a:1c0f with SMTP id 17-20020a05600c231100b0040c325a1c0fmr2115505wmo.173.1702301200374;
        Mon, 11 Dec 2023 05:26:40 -0800 (PST)
Received: from [192.168.8.100] ([85.255.234.108])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c4fc900b004094d4292aesm12831440wmq.18.2023.12.11.05.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 05:26:40 -0800 (PST)
Message-ID: <7ad9d49a-d649-4f78-ae89-c592117d7665@gmail.com>
Date: Mon, 11 Dec 2023 13:25:19 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [isilence:zc/rx-pp-provider 5/31] net/core/dev.c:2065: undefined
 reference to `gen_pool_for_each_chunk'
To: Yujie Liu <yujie.liu@intel.com>
Cc: Mina Almasry <almasrymina@google.com>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev, Willem de Bruijn <willemb@google.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>
References: <202312102313.zJHWVLAZ-lkp@intel.com>
 <182d28da-8822-4d2d-85fe-5a1843905eb1@gmail.com>
 <CAHS8izMn0JhRkmvF1yEvk1iUdYmHNbxbs8GgO=0GX6Qq5uR80w@mail.gmail.com>
 <18a68cf6-7738-40aa-869b-401bb08bc41a@gmail.com>
 <ZXZja1UjyhyHDNiu@yujie-X299>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZXZja1UjyhyHDNiu@yujie-X299>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/11/23 01:18, Yujie Liu wrote:
> Hi Pavel,
> 
> On Sun, Dec 10, 2023 at 11:15:50PM +0000, Pavel Begunkov wrote:
>> On 12/10/23 21:05, Mina Almasry wrote:
>>> On Sun, Dec 10, 2023 at 8:54 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>>>
>>>> On 12/10/23 15:45, kernel test robot wrote:
>>>>> tree:   https://github.com/isilence/linux zc/rx-pp-provider
>>>>> head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
>>>>> commit: 161f99ad49ca48fa141161b409eac11a6b63c105 [5/31] netdev: support binding dma-buf to netdevice
>>>>> config: i386-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/config)
>>>>> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/reproduce)
>>>>
>>>> Ergh, I have no clue, why lkp thinks that it's a good idea to spam
>>>> about someone's non-release repos, but just ignore it.
>>>>
>>>
>>> How do i enable this on my repos? I have branches on github I'd like
>>> reports for:
>>
>> That happened long time ago without my knowledge, but apparently
>> you can just ask them
>>
>> https://github.com/intel/lkp-tests/wiki/LKP-FAQ#how-to-request-testing-a-new-kernel-tree-on-lkp
>>
>> I'm not aware if they have filters for what branches to test
> 
> We do have regex filters for this. Please check the "branch_allowlist"
> and "branch_denylist" entries at:
> 
> https://github.com/intel/lkp-tests/wiki/Repo-Spec
> 
> Sorry for any spam on non-release repos. Do you want us to stop the
> robot from testing this repo, or could you provide some info about what
> branches to be tested/ignored so we can set the configuration for you?

Dear Yujie,

To be fair, it's a pretty useful service, and I appreciate the effort.
The annoyance comes from CC'ing a bunch of people and lists who don't
care about the patches, and who will then be asking me what's that all
about.

Ideally, I'd prefer to limit recipients for reports for that tree
to only myself. (and maybe some necessary technical lists like
lkp and oe-kbuild?). If it's not an option, can you help me to set up
a filter to only test "lkp-test/.*" branches?

-- 
Pavel Begunkov
