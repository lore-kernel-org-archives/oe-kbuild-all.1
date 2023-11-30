Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EB75A102
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K93t581+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cf8b35a6dbso11893005ad.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 10:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701369164; x=1701973964; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6DrkoL2F5FXMoIgI5kw+SZgzVJ3LqRocSDHuCIuRWOs=;
        b=K93t581+UYqeJyexd8KChfNHS4xMns8+j/KzM0PBid390du9I3SMlpdMrFcJP2VgEU
         4y2dEYA4M/JPfX3hKmfeLXwuYjK2AhwKJAvDf4W6eIlMmBhK/Hzkofy07ucocAKX8uQt
         9A8j9cQ8DMIqcKRrcdb9ugni9vu7kAiO9YGtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701369164; x=1701973964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DrkoL2F5FXMoIgI5kw+SZgzVJ3LqRocSDHuCIuRWOs=;
        b=mSvWzuBba2z+sRX3xwuSxQ/6L0/wyto+w6L/8axMvESKNOeTs83VJyckke+NNoB5rM
         uDZtcvQUhSXu+EszSYh4qEhRCf8UQ0vc26r14lJsLUDP2T6/80FqE8x0RYpnHapXa6o6
         jvrmNYmYY+LBn49ZhjKe5i+D/ZNOlUWkVNDhWVtlB58zHGDWFC9V2ucqxRnhDyAL+0q3
         JoClvgddLivJlwCKtg/SRyxX+zEEtEOm2IqGxi4lYTe1wzYWurb3N4cRwBax2BfPtqes
         8pJQuARYypqtJYg4iH+RGGtixcUxs61cC6mIZegldg74PTIFasna1EXIhc+De31XQehn
         ETNg==
X-Gm-Message-State: AOJu0YwPvO+zGReqWM2Wh+X3QlIKIQF4xiM8Ua0BvlNAmcvggrtwvUIe
	XHvaKmhTPPGYnkHqzYwaXElBzQ==
X-Google-Smtp-Source: AGHT+IHeBC52IDY3dqw4t7rZkCKWHU87e7hS517ioPtc4SJRTR1BaOjh3Ut1PKX8KJpkr+JHyuM4Hg==
X-Received: by 2002:a17:902:bb85:b0:1d0:38f6:9188 with SMTP id m5-20020a170902bb8500b001d038f69188mr2035644pls.58.1701369164544;
        Thu, 30 Nov 2023 10:32:44 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902cecd00b001cfa3022adcsm1726452plg.47.2023.11.30.10.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:32:44 -0800 (PST)
Date: Thu, 30 Nov 2023 10:32:43 -0800
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Michael Walle <mwalle@kernel.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Max Schulze <max.schulze@online.de>
Subject: Re: [RFC PATCH] wifi: cfg80211: fix CQM for non-range use
Message-ID: <202311301016.84D0010@keescook>
References: <202311090752.hWcJWAHL-lkp@intel.com>
 <202311090752.hWcJWAHL-lkp@intel.com>
 <1c37d99f722f891a50c540853e54d4e36bdf0157.camel@sipsolutions.net>
 <fc1dbe4a-a810-445c-9398-60a5e55990a2@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc1dbe4a-a810-445c-9398-60a5e55990a2@quicinc.com>

On Tue, Nov 28, 2023 at 01:01:20PM -0800, Jeff Johnson wrote:
> On 11/28/2023 10:23 AM, Johannes Berg wrote:
> > On Tue, 2023-11-28 at 15:44 +0100, Michael Walle wrote:
> >> Hi,
> >>
> >>> net/wireless/nl80211.c: In function 'nl80211_set_cqm_rssi.isra':
> >>> net/wireless/nl80211.c:12892:17: warning: 'memcpy' specified bound
> >>> 18446744073709551615 exceeds maximum object size 9223372036854775807
> >>> [-Wstringop-overflow=]
> >>
> >> FWIW, I'm getting the same error with the current next (next-20231128).
> >>
> > 
> > I actually forgot about that, but does anyone actually know what this is
> > trying to tell me?
> > 
> > The code seems to be
> > 
> >         if (n_thresholds) {
> >                 cqm_config = kzalloc(struct_size(cqm_config, rssi_thresholds,
> >                                                  n_thresholds),
> >                                      GFP_KERNEL);
> >                 if (!cqm_config)
> >                         return -ENOMEM;
> > 
> >                 cqm_config->rssi_hyst = hysteresis;
> >                 cqm_config->n_rssi_thresholds = n_thresholds;
> >                 memcpy(cqm_config->rssi_thresholds, thresholds,
> >                        flex_array_size(cqm_config, rssi_thresholds,
> >                                        n_thresholds));
> > 
> > 
> > Or does it just want to say n_thresholds shouldn't be a signed variable?
> 
> +Kees for flex array education :)

Yeah, I would expect this to mean that there is a code path that
GCC found where the value could overflow. It does this when a variable
"value range" gets bounded (e.g. an int isn't the full -INT_MAX to INT_MAX
range).And flex_array_size() was designed to saturate at SIZE_MIX rather
than wrapping around to an unexpected small value, so these are playing
together it seems.

However, I would have expected the kzalloc() to blow up _first_.

Regardless, I suspect the addition of "if (n_thresholds > 1)" is what is
tripping GCC.

                int len = nla_len(attrs[NL80211_ATTR_CQM_RSSI_THOLD]);
		...
                return nl80211_set_cqm_rssi(info, thresholds, len / 4,
                                            hysteresis);

Now it "knows" there is a path where n_threasholds could be [2,
INT_MAX].

Does this warning go away if "len" is made unsigned?

Does adding an upper bounds sanity check help as a work-around, like:

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d0f499227c29..2cb78ac44b6c 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -12855,6 +12855,9 @@ static int nl80211_set_cqm_rssi(struct genl_info *info,
 	s32 prev = S32_MIN;
 	int i, err;
 
+	if (n_thresholds > INT_MAX / sizeof(*thresholds))
+		return -EINVAL;
+
 	/* Check all values negative and sorted */
 	for (i = 0; i < n_thresholds; i++) {
 		if (thresholds[i] > 0 || thresholds[i] <= prev)



-- 
Kees Cook
