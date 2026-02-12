Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6968118B0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 04:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770870663; cv=none; b=tPo6oa38Q5bWryiyIsmd3aB8+V49Hno9tHoUGzftUw06nNafeLXDrhcQyv2ICP5tvMy674DnpHEXjOYXbzVEGOUmnJY+T4XpHeNWsKIiA6L3Jo27LtXw3dmTyio1ChuK8872USHwIbFr7WtdIjR6AvGR/aRIDm0BJpkG+gZDgxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770870663; c=relaxed/simple;
	bh=A5HJcCKxAsHpNeprXQQ2Ms4Osb6cPf2AX08DAxbWxU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNg0gFuG8zkLLqj1ctshzFkmnPjpQyn+VlbZT204AownR66k+OMQrUysOR94fOlZ0a+SBlH3+9lJckeD1deQNCXSzInJdSaHMw2AhvsEaZbTHEdQ6obFYUFyabKyjhygisPQuADCvblCz41u7uWwWYEcuIZXknKJ2nePFjFMi/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hBCE+aEX; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hBCE+aEX"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d18d0e6d71so3993005a34.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 20:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770870661; x=1771475461; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4Ihvw6EZ0tT6LZ8X2ohWxs32TnyPwD3MnzBsPDVJ/4=;
        b=hBCE+aEXeCpBKcBK0iVlHOLRUGsxcoy9MTvtSOVJbgFteFEbqNVRiut81zYSSfdyst
         MgTFpOiII1pP/p7x/gp+9tKwvDW7S44tlrt8+S4BKJ1SF2QuLo2nKS9MaUWoC1JhkFmw
         vzE+AiDN3IRgzT0DrrWCxwr2ntX83+MAvicFXEp8mzSmfYOjyn0M2L9E67DqcGzdYsKr
         V8aTxFLpyj+HXOzZCv8s9Ux+kYgb+3upow8u3EYwtwdl1DB0Cp1Kw89nq8RbrBTVdpP1
         DFBh4oH4b0xnqgbsoofVquGdBHNbmSNeaEoMG3mFsFKkozktSWSbO+mLMZIDrtvvMAkC
         QGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770870661; x=1771475461;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4Ihvw6EZ0tT6LZ8X2ohWxs32TnyPwD3MnzBsPDVJ/4=;
        b=d7VVTpTjFl+LAFTopJ2uWwO2hCOAjwtRQEsnfImRuHMIgW/8V21o16vwI4Fx+Cqvnt
         nOWbM0fgQ1nWwRWMeRQpEQViEnBL4zWTPxHYMYiD8m8osalY69QiHD+wg6r3dJtoXdUs
         ENadfkciDnSgI0XwRd7zZdt0X4721fN1hgEeqrZ5I1iiGnZ5m2WBSomdBIu+1eYsuqTr
         v9omfPKrCeDH4MDxNBy+iKqPPF237MnGo3d2kQpFkGPUGAJz0YMROBcLdvX6L1h7t8KW
         58FBHbFRnzAojdK8YtR37vuG+h93z77Kd9GJA3rg1FR70WmlUFq+dANeCJr9y9/3XevL
         T51Q==
X-Gm-Message-State: AOJu0Yw0LTwCEoMjZDVOyFJ7IGZrkg4nSjPQ/dEAY50dm32JImyjk9Kd
	P47KuW4TupgFbS1oISHE8Vk56TgAoQg8XAYrVOFVGpS7nJx43Uc7pvnA3nUnJ+jq/A==
X-Gm-Gg: AZuq6aJbpqLdfkiDCTCgBzRxz6+XcMYZZmDu5/U3MIDohS5iGTp71JZK60KzW4t1Zf2
	eofQcPnf/dOX/vdsOTEOHU5zVNVOW5mS9+8pcNX0ngAeQIL3QhsqZUbwzPx6VcgQ9Hbqz9tkDfD
	7lhsfGOSuQuZN//xMuZC8nZDOpvBiQZq3+Yylc1blJlKP9M7cDSlGwUTNuPobFFuxYW/F/PlDHT
	BlgGq4h2mv7y+E2MfXswQKxmDiLG8fTzToffxXgNWYPJBHEeNuD6uKJVM2E8m3owKW8C2+krwFl
	ECsrecTsg0XgIf0R70hb6N7besgzwEot+rf7aoA2cDnL9lkwJO08q6VVsPBOT8fuPFpFzq7QOya
	hsZLyIg4qKBc1jdbnQSOOE2u9PIYMc9Hw6dE7RGnqCaIJ0o3473xkwnBwsZDo5tSd0do+Ao3j90
	/7zd55FOw7evzBvFnk/Dybf2dW1kaq8v5aDNZIuQcxRdA7DYF0nI+Va2sXz1zrqQIWt7Oi1sU=
X-Received: by 2002:a05:6830:631c:b0:7cf:e57f:def6 with SMTP id 46e09a7af769-7d4b298b8a8mr955597a34.6.1770870661018;
        Wed, 11 Feb 2026 20:31:01 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:76c9:5d3e:a5ad:fa9e? ([2600:1700:4570:89a0:76c9:5d3e:a5ad:fa9e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7530d08sm2833057a34.2.2026.02.11.20.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 20:31:00 -0800 (PST)
Message-ID: <d6a67899-b82b-4738-9ad5-27cbd735ff2f@google.com>
Date: Wed, 11 Feb 2026 20:30:56 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: typec: tcpm: add support for Sink Cap Extended
 msg response
To: kernel test robot <lkp@intel.com>,
 Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Kyle Tso <kyletso@google.com>, RD Babiera <rdbabiera@google.com>
References: <20260211-skedb-v1-2-616340426cdc@google.com>
 <202602120453.BOyqL3t6-lkp@intel.com>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <202602120453.BOyqL3t6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/11/26 7:56 PM, kernel test robot wrote:
> Hi Amit,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-connector-Add-sink-properties-to-comply-with-PD-3-1-spec/20260212-072745
> base:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
> patch link:    https://lore.kernel.org/r/20260211-skedb-v1-2-616340426cdc%40google.com
> patch subject: [PATCH 2/2] usb: typec: tcpm: add support for Sink Cap Extended msg response
> config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260212/202602120453.BOyqL3t6-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120453.BOyqL3t6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602120453.BOyqL3t6-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> Warning: drivers/usb/typec/tcpm/tcpm.c:351 cannot understand function prototype: 'struct pd_identifier'
>>> Warning: drivers/usb/typec/tcpm/tcpm.c:368 cannot understand function prototype: 'struct sink_caps_ext_data'

This is because of the incorrect formatting of the documentation
comments for these structs. I will fix it in the next revision.


Regards,

Amit

