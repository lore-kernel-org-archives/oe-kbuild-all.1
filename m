Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065424F212
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 21:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706043893; cv=none; b=CFmjIZeE1f/QEiOhjiPMq7e1t8EB+iUtX/5uYHPGgdrwiEZRgkqxhOpgej6AhRTCV8MvCIGrUHeP2uD8KBqn0N/uylDh1ymxnD8TdPeES6jROy3wrhdFKp+io4+tEpoJuYwb5bhvnhUNDDHBqdI1RY78l+0CFWegZ6Y8XfFH3vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706043893; c=relaxed/simple;
	bh=Wql55NSu74RChfsWDEJ+8GIyniG2mIClUX2TKzJUz4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPtIW0kfs3DUthssGRm9b/HxkJjoC+8K8AAcLUAd8nltql/wXTEXmgDWacS+uRleGnDao+C7yOXlprQD613+HN+NVvRwL5bvGcTVTUFdBhDFuNje4cNkvVPbZSkuqjNdqQAzpsONJ0xM9hOMPslvcXUXYMYm4RioFP5nmCEgfjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVqO7Yas; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVqO7Yas"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d70b0e521eso34740415ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 13:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706043891; x=1706648691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYw/qbtyA6IDie81vfIVJqc6FfWuXktsl3KKxMsgDxk=;
        b=iVqO7YasO2oPjC1ulFEIY81QVhCN8E8TpGl7RUqu1QutbQi3/jMd71vNRe1Dggfsms
         ljotQ/Z9pzYhn85zG3RRcAsG/UGb3bBx4anvWOlh2gczO3jRFMm4cU33QjEc8D6oKCJ7
         3UWo6tKmiS2ylUmcmDUhSXEWg2woQtQWYzzf03YsDdNNMyVd5XZsG59qHDvsfbcCdCcO
         GS5SmANjx74AKvKZ5MP2h+vxo6DK17YBam3R0hYFKt5TxCB39T2L1gTJOrM5eVtbzI4J
         qR2chMD8mN40aatk2S8A9OIrbCitWHODpz4jwVQPI6HXOLpZtx75I2CXf5cfEVApMmI/
         MH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706043891; x=1706648691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYw/qbtyA6IDie81vfIVJqc6FfWuXktsl3KKxMsgDxk=;
        b=Yj0Zk1q9pTcQEopVql3oOiEdtd4+mPBasAUw3DSNik90ci8k8j06WcVydxMmLxXNG2
         GpV0ToEZr3F/bA/w2jJZTMKHD75SmfhqyvM3E7LmWIh0TIEiEqfJbwpv6gRJSFcfuBsS
         xZprSyTYcOLkmteWiirI3lDXoS/klwYmszuHzxCADCsQ2kttQnXRuauQ4ADv+Le/F8fC
         Sq8wJxzrDocpAXLHofuHwlO5Wlkhw95fRgc8OaXvUKohfaWIDzdpo7IvxLSy8pa3Z3j4
         ghSZjjVtSFpjWoj1VDb4uNXc3SWfd3To4P0ARBPZypAsgjuztuzqqxsncN4nA+MoGcVI
         Funw==
X-Gm-Message-State: AOJu0Yz6UyeS58UIGMroHBqTlh9CAOLDQwyQOyIbfh9yIgVaeD+PPA/2
	f9e8bpjrYPc4zoQqdf023qBaI6nGpdb+suLNgiS3FpAUZhtN//bD
X-Google-Smtp-Source: AGHT+IGGvNtUrKPkZQC17vrIAF1boUpeIr+U9wxmmBhP7NZhHcdBnlWtZsaz6GSu/XMb6p6i9q3t+A==
X-Received: by 2002:a17:903:200b:b0:1d5:f10d:2ac6 with SMTP id s11-20020a170903200b00b001d5f10d2ac6mr4964631pla.115.1706043891081;
        Tue, 23 Jan 2024 13:04:51 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:cddd:d715:19de:f1d8])
        by smtp.gmail.com with ESMTPSA id lo15-20020a170903434f00b001d71f2ae008sm7455065plb.85.2024.01.23.13.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 13:04:50 -0800 (PST)
Date: Tue, 23 Jan 2024 13:04:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: Re: [dtor-input:next 134/135]
 drivers/input/joystick/adc-joystick.c:194:10: error: implicit declaration of
 function 'min_array'
Message-ID: <ZbAp8Lfn1GCWeqYe@google.com>
References: <202401200614.B4PnBzhk-lkp@intel.com>
 <DM6PR06MB533707F89AA767C845DD3D68A5742@DM6PR06MB5337.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR06MB533707F89AA767C845DD3D68A5742@DM6PR06MB5337.namprd06.prod.outlook.com>

On Tue, Jan 23, 2024 at 10:17:25AM -0600, Chris Morgan wrote:
> On Sat, Jan 20, 2024 at 06:55:32AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> > head:   3af6e24a456437d323d1080bd254053f7af05234
> > commit: 6380a59c534ecab1462608a1f76490289a45a377 [134/135] Input: adc-joystick - handle inverted axes
> > config: i386-randconfig-011-20240120 (https://download.01.org/0day-ci/archive/20240120/202401200614.B4PnBzhk-lkp@intel.com/config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200614.B4PnBzhk-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202401200614.B4PnBzhk-lkp@intel.com/
> > 
> 
> Assume this means we need to explicitly `#include <linux/minmax.h>`, right?
> 
> Should I submit a new patch or a bugfix for this patch?

As I mentioned in another email I think usage of min/max_array() is too
clever here. How about we simply "swap(range[0], range[1])" when axis is
inverted?

Thanks.

-- 
Dmitry
