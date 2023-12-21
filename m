Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15EC5822D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 17:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ie8mJFnL"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-35fda62c113so120245ab.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703178408; x=1703783208; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXaZc6e1nMl9atN8cXeIsmcg04sRlmJY+YN4XcJ2oGs=;
        b=ie8mJFnL64aJFahJUwvxlYbkGzndAKyh7j3DELBQfdHXKWAAf+HrYVNhkWNmXUjZ7T
         ek9e5xWNaahf4fiZxcMPoFVs9s7VASnBKxwO+FiZ5ol/vSFNwbUJYqXOga7kul6Bteux
         YkL9C46k9hw9LCKFMXsqpfb5adbntBbHwiA84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703178408; x=1703783208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zXaZc6e1nMl9atN8cXeIsmcg04sRlmJY+YN4XcJ2oGs=;
        b=jeHRo8Z/VnlqftwjYiQffYenO5VbKwy0jEli9xBgvJArU+SCfYa2dAOIUOrXHJdVWK
         9O/j85OdaBFL7ewa/EByGp5yMAtW6/zTnbSLmTTkC8ZKKlP21c6ZnoSm++7YvX+jFLb+
         rO7+7g7jm6By1eirR1Gxur0lA8aWtZOTBDlNhSds87qKKcCYybIquTQnVgmnLq5huqOY
         uga5NlFy2SNkLsgs5QaoxpaTTJxokXdeiHQ5AMREJmMcGzmB3gl57cKKwqoakTu4mCI9
         Sbhf+xIOsLzwbs4zx79ZTUmaPZfKC71K86MfYPPwPA+qZ7E4w7AfACZiyX6aAeO9LAwk
         x7Gg==
X-Gm-Message-State: AOJu0YwzNhibki7xrkwrxdI+gOArJkpfeF6ii3LLVHpgCdsFAyTdsFf8
	x+ZV8SOPnPLv+xxlul40szyM7A==
X-Google-Smtp-Source: AGHT+IG7qdmMEvMI19PjLbihSb3rEB+i9RRoC6kzIRiEqB4bKPSXjN4tW2TcuSjwGSVvko69lfC2iw==
X-Received: by 2002:a05:6e02:1bac:b0:35f:d4dc:1b1c with SMTP id n12-20020a056e021bac00b0035fd4dc1b1cmr1840905ili.0.1703178407863;
        Thu, 21 Dec 2023 09:06:47 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id d1-20020a92d781000000b0035b0b05189bsm602713iln.38.2023.12.21.09.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 09:06:47 -0800 (PST)
Message-ID: <19a9ebb7-dc08-4f29-a893-e90cefe19916@linuxfoundation.org>
Date: Thu, 21 Dec 2023 10:06:46 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 8437/9113] lib/kunit/device.c:68: warning:
 Function parameter or struct member 'test' not described in
 'kunit_driver_create'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, davidgow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <202312181920.H4EPAH20-lkp@intel.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <202312181920.H4EPAH20-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/23 04:47, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
> commit: dcb420cba3162bce885a2127865888850a6d6b99 [8437/9113] kunit: Add APIs for managing devices
> config: x86_64-buildonly-randconfig-003-20231218 (https://download.01.org/0day-ci/archive/20231218/202312181920.H4EPAH20-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181920.H4EPAH20-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312181920.H4EPAH20-lkp@intel.com/
> 

Please send fix for this on top of linunx-kselftest kunit branch.

thanks,
-- Shuah

