Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C146D1C16
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Dec 2022 12:44:58 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d3so9384567plr.10
        for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Dec 2022 04:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/BIynU2NWG7vKdIOfvZ+4asmhXgFyDxZr8sjMOqoFm8=;
        b=VLTR7S/5ahNq29JrLlj5T02niU5r0jRh5WDqvlUJIfcTSpIEpzp81s8kGrBPHDXP0B
         tOZN0FlJjcKYQwFlxGliUGZTkgXsKcQc3RbSg3t9HqcCLJ2sYbN65lsRdjEv4d3Ieipd
         /++8MJEOed7jHqmpcLZRBpL6fxIgF5bnecqhSUejVteb9/vPQW06qcwOHn0sok3JZoOO
         js6Jk/GGYyV3M2lHhJ5Tae1CGHfTY8+Nvz1idEjTvRwOEq++Zj4MFSLqu8XwLTqyxX8c
         v8dbXeurnS/gLdxLUrM/xLQhp8LQwFg2BTGpf47mhbi20bXhzX+IdV9hoRhu5vfwW1qM
         fKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BIynU2NWG7vKdIOfvZ+4asmhXgFyDxZr8sjMOqoFm8=;
        b=fwSsT7X++I8pRFYTsr0I4kvgdlJ6QWSksXhEAZK51ePjL0mTP3m2FyUK9q+pZlQfEy
         Ulxtp3yk61ommoWhSCWQwu4xf11YxXRL6eDRfo0481QtMCazDotis2ync9WjwPfE+u6J
         PnNoS4rWULuWnoqqGIRLtnHJyIhxLODY9qO35psRS9pQJ3Ha7br2w7X2MbcQauaPC7iS
         tTuuKLn2Ox1ebJ6BcqMHCpBia5kI6L2K9K5IZiY2yd171uElr8vbMMHLPA9or2uNi517
         WcxyrzIpdgKiC06NSi4cpfHGf6D4LmUK6E5WFRZH2pb40FDl2hIG8Md6DW6nooX/kDtd
         vkZQ==
X-Gm-Message-State: ANoB5pnHcIODj2dRuFHWvZOuYVYQSqTFvq1uvu+YpPselT/iRJJ4M0r5
	0lB0r8MPOTZffLrP5IAmrEw=
X-Google-Smtp-Source: AA0mqf7yK/8RDsOO7DyGcjv6lNtY/SWehdEVnXgQu3jHlPDi09fOM7Wba1DgYdpDPCZKOaXs9yAeeA==
X-Received: by 2002:a05:6a20:ce4a:b0:a4:69a2:6dd7 with SMTP id id10-20020a056a20ce4a00b000a469a26dd7mr15160149pzb.0.1670762698199;
        Sun, 11 Dec 2022 04:44:58 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-66.three.co.id. [180.214.233.66])
        by smtp.gmail.com with ESMTPSA id w15-20020a17090a4f4f00b00218fb3bec27sm3620808pjl.56.2022.12.11.04.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 04:44:57 -0800 (PST)
Message-ID: <38ad5cab-bcb1-bb23-b141-7ffc07acde78@gmail.com>
Date: Sun, 11 Dec 2022 19:44:50 +0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Documentation: gpu: vc4: add blank line separator before
 KUnit code block
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, kernel test robot <lkp@intel.com>
References: <202212102116.A10vg3jG-lkp@intel.com>
 <20221211053051.18125-1-bagasdotme@gmail.com>
 <fb978a9e-43af-865a-00c6-d98499414ec5@igalia.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <fb978a9e-43af-865a-00c6-d98499414ec5@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/11/22 18:32, Maíra Canal wrote:
> I believe Maxime fixed this issue on [1], but it hasn't been yet merged
> into drm-misc-next.
> 
> [1]
> https://lore.kernel.org/dri-devel/20221208094727.2848310-1-maxime@cerno.tech/
> 

Ah! I don't see that!

Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

