Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656D319E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 10:30:03 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-95369921f8eso1580488366b.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 03:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1682677801; x=1685269801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6ZT6qPfbY61GV2mUTjxHMfduki53jSqulYZ0LIEF0I=;
        b=XARgRa/NLU0s1xdmZ8jwJjgTFjcztt2wYny2R3RNgLUShEY8yIQWq4ywkU4bkI63m+
         INrK4yE46kVKqIMP8DYE0590wK0u+dsDrLkPAeS4s3P4K2VGkd/LvzkO2GO2dpc08gFU
         OjPovE3RQuVhSvf9VxUvHbh7nyCgtNSzDIYuG1R0Nhc3TokJ36Bpya2TdGrG+wqlS+YJ
         U8YC380Kt9qq5b6WJXf9BRWyLJ4uKyOY5uuUoSv3WPNyKkaBPM+8DbpckBO1vMU590JQ
         Er+hvdqsSXmWM2+Wa+StW3owKBhyOQgfPnzEj8Z8mrEV6pGXe3LiNMfp+Dfc7wJChit+
         3XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682677801; x=1685269801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6ZT6qPfbY61GV2mUTjxHMfduki53jSqulYZ0LIEF0I=;
        b=A6sIppPniU8I4jdr33vwZ2Hz3FJ3tFcB4owCaZrMWCPsSEJVXbxBGoCHV+L9rqJ5V7
         NGBmyffxGu7FttGNa9NTykEClIH4VC1KmbKwwNhSNQaFkZrRD5bwyxIs8iRYzVk9kyEw
         eQoy5woeCajWa3FmTM3F8ZHW3I/Fn8dZ+3E+M0sTrrZRxkHMEx2WsjvQDWkwIdzAA6SH
         PCW5yq6HdlbWcylxIv1XarRF67KNAzvpyLu7m6icfXpqMQQxoytu7dyPJ/jcKLLYwFfV
         WXwUdU/uaQcwMrLU/r0+0xaRrD80eaMvdQmtntxhbi+26jQoKFMX79o5L+avqidOZUTL
         PY/g==
X-Gm-Message-State: AC+VfDzz9/6nFMdzja3V8W+VlDYqnLZE51MPxR3VRP9s0uhC2zQcT5zL
	vWO5uKYRqO9YaEqMii6SqMILHclen7pMh4lDBSUFtWsK
X-Google-Smtp-Source: ACHHUZ6GfCg6AVeyn+XTFSxdpGkoQcLBF2furjwmnaarPlLtE8uvLkoy+bf8Ndmfy719q6Dt9k5LSw==
X-Received: by 2002:a17:907:d1d:b0:94f:3b83:a4d1 with SMTP id gn29-20020a1709070d1d00b0094f3b83a4d1mr4605924ejc.50.1682677801331;
        Fri, 28 Apr 2023 03:30:01 -0700 (PDT)
Received: from [10.44.2.5] (84-199-106-91.ifiber.telenet-ops.be. [84.199.106.91])
        by smtp.gmail.com with ESMTPSA id l7-20020a056402124700b00504937654f8sm8942942edw.21.2023.04.28.03.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 03:30:01 -0700 (PDT)
Message-ID: <d43a4e40-231d-879f-905d-c258e6d688a8@tessares.net>
Date: Fri, 28 Apr 2023 12:30:00 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5.15] selftests: mptcp: join: fix "invalid address,
 ADD_ADDR timeout"
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
References: <ZEuV586CQyHtECVB@afc780e125e2>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <ZEuV586CQyHtECVB@afc780e125e2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/04/2023 11:46, kernel test robot wrote:
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
> 
> Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
> Subject: [PATCH 5.15] selftests: mptcp: join: fix "invalid address, ADD_ADDR timeout"
> Link: https://lore.kernel.org/stable/20230428-upstream-stable-20230428-mptcp-addaddrdropmib-v1-1-51bca8b26c22%40tessares.net
> 
> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> 
> Please ignore this mail if the patch is not relevant for upstream.

@Stable team: I confirm, this is not relevant for upstream, this is a
specific patch for v5.15 only.

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
