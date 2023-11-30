Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F415916B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 18:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eIr6KogI"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d048c171d6so3743315ad.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 10:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701369970; x=1701974770; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqmKExj/Mv5RpM6S+8jCnwhQH5wvdmwNgK4JjLqPLxY=;
        b=eIr6KogIDgoXQBT5gsPvgjrhwBebmKtWH0Q3cRF00rrMKHiwff+9RXf39Gj5sZy9y/
         sBdgwTblL8MAQHfFzyJSHH67PIdRcOHIGC2X5qGhdZ+VWlsy3ocZ/MLiUyjO068B96oT
         BY+hhmrdihBmFNr8OBoAiY4KKeh6OElqMyY48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701369970; x=1701974770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqmKExj/Mv5RpM6S+8jCnwhQH5wvdmwNgK4JjLqPLxY=;
        b=AGx1MtU3nafMOOzC2IDF5w1wY/rLHnsJ/UMl1PL9RSPpAIQCMw3C5Cmd8T61yavBFt
         wuVVj1aWmXClFObFarx1hklJNAdRuyOj8wUlQjortbD/k8Z4fZ2N2NzAbqJkBPPJmHrW
         m7cBFeur+d/X/TDmMx+57bjSwuPasyvo0FBpNK5qCTbJMr0OyfuTdPuGH9Sjk02BqpM1
         9Ozwij0/XKN/FX2eXuxrF9ZYByDMRUkpsi6B2LtnZm6S+XbmPm75tJLVViGjcL3SnA37
         GjCH+UKaBbJ1+ix0njKHXFOndtSvViU7SDD+adVNflzIqBhTCnf5IrBSpMUJPJ3Du+AJ
         wWnw==
X-Gm-Message-State: AOJu0YxDHL3uquMGtYsmeIYfUNo/ZhLip6nd7t7LOmpEBawN1eqLhYIj
	vYk7NWrFNYhcSHzd1laMlI289g==
X-Google-Smtp-Source: AGHT+IGMeNXhdzIngIMI6Tzqw3ooKUlw4KdmTCBArrH5SoAcoNzPZ+6yZoCGN0NfHiDu6oY1EIRIjQ==
X-Received: by 2002:a17:902:c106:b0:1cf:cd57:5ee7 with SMTP id 6-20020a170902c10600b001cfcd575ee7mr14635168pli.28.1701369969718;
        Thu, 30 Nov 2023 10:46:09 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902e5cc00b001cfdf290e82sm32218plf.35.2023.11.30.10.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:46:09 -0800 (PST)
Date: Thu, 30 Nov 2023 10:46:08 -0800
From: Kees Cook <keescook@chromium.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Michael Walle <mwalle@kernel.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Max Schulze <max.schulze@online.de>
Subject: Re: [RFC PATCH] wifi: cfg80211: fix CQM for non-range use
Message-ID: <202311301045.6DA830F7@keescook>
References: <202311090752.hWcJWAHL-lkp@intel.com>
 <202311090752.hWcJWAHL-lkp@intel.com>
 <1c37d99f722f891a50c540853e54d4e36bdf0157.camel@sipsolutions.net>
 <fc1dbe4a-a810-445c-9398-60a5e55990a2@quicinc.com>
 <202311301016.84D0010@keescook>
 <01e3663e9e1418a183ee86251e0352256494ee28.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01e3663e9e1418a183ee86251e0352256494ee28.camel@sipsolutions.net>

On Thu, Nov 30, 2023 at 07:40:26PM +0100, Johannes Berg wrote:
> On Thu, 2023-11-30 at 10:32 -0800, Kees Cook wrote:
> > Yeah, I would expect this to mean that there is a code path that
> > GCC found where the value could overflow. It does this when a variable
> > "value range" gets bounded (e.g. an int isn't the full -INT_MAX to INT_MAX
> > range).And flex_array_size() was designed to saturate at SIZE_MIX rather
> > than wrapping around to an unexpected small value, so these are playing
> > together it seems.
> > 
> > However, I would have expected the kzalloc() to blow up _first_.
> 
> Hmm.
> 
> > Regardless, I suspect the addition of "if (n_thresholds > 1)" is what is
> > tripping GCC.
> > 
> >                 int len = nla_len(attrs[NL80211_ATTR_CQM_RSSI_THOLD]);
> > 		...
> >                 return nl80211_set_cqm_rssi(info, thresholds, len / 4,
> >                                             hysteresis);
> > 
> > Now it "knows" there is a path where n_threasholds could be [2,
> > INT_MAX].
> 
> Yeah, it's not _really_ bounded, apart from the message length? But then
> struct_size() should saturate and fail? But I guess it cannot know that,
> and limits the object size to 1<<63 - 1 whereas the copy is 1<<64 - 1...
> 
> > Does this warning go away if "len" is made unsigned?
> 
> Thing is, neither Kalle nor I can even reproduce the warning locally, so
> it's a bit hard to check ... not even with their config and gcc 12.2.0
> (nix, rather than debian though.)

Ah! Hmm. Let me see if I can coax out the warning locally...

-- 
Kees Cook
