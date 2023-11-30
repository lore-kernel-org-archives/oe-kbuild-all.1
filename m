Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2192052F76
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IHjQWHRS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cfc2d03b3aso11605525ad.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 10:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701370517; x=1701975317; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o/bzlkcxWIvJcapDgBF0UDoZol+j+J/d9ElDaLghBao=;
        b=IHjQWHRSKSjRfMIdB16T49O0h/eQdi9PwXwRkpxUnVAY+mtr/Cb+s5kA92nscWxrqY
         FFn5QvF6IGcDm3g/I//FIfy+y5vIyhbygxyMl9ca5rsMX8Xr5IHw5WAqPZR4vfmvXDWI
         7eSqlCtkH103WBbQbvVhpTQtXJ5AFeC+bbqD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701370517; x=1701975317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/bzlkcxWIvJcapDgBF0UDoZol+j+J/d9ElDaLghBao=;
        b=mLhUDSFfeDdzghmWa/mRgK5Pi8mPtTNclqUzSj2YtRX/DiKoyjMCUIeto0G3jL+Xl4
         8zz34P6GeTWflv8GUaZHyLKGdlrIPc54+k0klPks1fczJAEwycLQZhD94YnsopQkRk14
         iK25C5YvoJaRpHS9FhbAnGRRsf235qdNttW4m9PfF5zqiA4uXcI2fCoEhn4sVCF4RfS+
         52fKnKFJLubJdN1bpaQruLtkmsja3JNdfVhRMdsHHSSB8VJ5W5ccaOy+oWVU8FaAWtlo
         UuJ3zYaJEXrw5/s5NxjSMZeqUJ/kXbqnDd3SQu46oXal2+IuRs6qen0Y+Sl4j8A6d1cJ
         S3Yg==
X-Gm-Message-State: AOJu0YyFj+Dq/+33eOm/Fr5b5gtqcPdHgt0xk2si+s5zc0cBZmwSAxLt
	ZMIV/3d0qSYwF79m4w/9HZgExQ==
X-Google-Smtp-Source: AGHT+IG9wFLvlwyxfm/BW91USfaiVHUUl147jWOXSej9Wr/vbn4JU0jdWKnBu9zl2klYM+Jj8oAI9Q==
X-Received: by 2002:a17:902:c1d5:b0:1cc:45df:4710 with SMTP id c21-20020a170902c1d500b001cc45df4710mr21374814plc.40.1701370517354;
        Thu, 30 Nov 2023 10:55:17 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001bd28b9c3ddsm1727297plz.299.2023.11.30.10.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:55:16 -0800 (PST)
Date: Thu, 30 Nov 2023 10:55:16 -0800
From: Kees Cook <keescook@chromium.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Michael Walle <mwalle@kernel.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Max Schulze <max.schulze@online.de>
Subject: Re: [RFC PATCH] wifi: cfg80211: fix CQM for non-range use
Message-ID: <202311301054.0049306B7@keescook>
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

Actually, this alone fixes it too:

diff --git a/include/net/netlink.h b/include/net/netlink.h
index 167b91348e57..c59679524705 100644
--- a/include/net/netlink.h
+++ b/include/net/netlink.h
@@ -1214,9 +1214,9 @@ static inline void *nla_data(const struct nlattr *nla)
  * nla_len - length of payload
  * @nla: netlink attribute
  */
-static inline int nla_len(const struct nlattr *nla)
+static inline u16 nla_len(const struct nlattr *nla)
 {
-	return nla->nla_len - NLA_HDRLEN;
+	return nla->nla_len > NLA_HDRLEN ? nla->nla_len - NLA_HDRLEN : 0;
 }
 
 /**

-- 
Kees Cook
