Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7801DF997
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 05:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740030618; cv=none; b=F5kRZxcMzA/68RIuTox25QRjmnm6pKVNgc/6VS3P5AisZ9E7eKMx/hPssroIxMVrzsR+6rA5efTKt/mVgna1mh28+aymfP8qJLVD8ULhxTbF9AHJsWQEOiK9HhsE+qNXMCEfyxvhH0j2zRp9rj3dd17sggHEiRDgTvs9q7M8sxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740030618; c=relaxed/simple;
	bh=bSs6EObO01GFd1/soPW4V2bEKCnO+2d7+Dd0Cr0R9AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMJOtSj2EOsA8IZcqIKMGQBc0/WnsoZyqXQ77dcibT8cITd4oS+SjYMjy8/oelun1W3aYn8wM2o5r+u9PYjD1fqfXVY0e3YZ56RvuLo6r2aH5Ogzgpu+SDfWMTFmYanGvsy72cP2VEUufIldVVhPg6BrNDQmPfC/jXOXvAVJWNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rnTs4CdI; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rnTs4CdI"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb75200275so89229266b.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 21:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740030612; x=1740635412; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4UdQnDrC//12flSexyKbPIUDcd8LQ6iO5eT8IHA0tm4=;
        b=rnTs4CdIn7XWwsxzFDPvBb+MvY8uWmhEqxWvZUcssfbisxhRxwQoOwQ+ydRIGrmMnD
         dEchwHiyOL3V5gxJWioIKBuR8GKIVWyRwKwgNaazDCw7ZxLXL7RYxZkkZhGpNbVZ3v/l
         ce+mqnI8lfvdQpqCUoWA0UQJNqvqrWoeQf8DGWnO/BeRJ/Cz//KrvSauUZpRVXOjcGMJ
         XcTMdX/Z9y2PAFo+eWdQADk8a/mk4EEeLYHHdcMqIJ5p6jOAnuNO1b6jcX5/rF1us1q5
         QV3sRhHDWP7aJ2RDvXkooGkpr5+Dg2FHxtWAOMvr+Cj+vSRDzJQoLqx3AuuM40d1f98k
         mbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740030612; x=1740635412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UdQnDrC//12flSexyKbPIUDcd8LQ6iO5eT8IHA0tm4=;
        b=ARAbmra3JAPRx+UurJB2HP0IScfeA2E1UyxVhmIUdgOZFwkEqlBbryxwxaTBlx6mWy
         enZNZj6lXzFWi0IwIgABcUKUNxpoyqdIpOfsu3VKGPajw+GJ4SqDAdGzdfPuepxuslQZ
         AqGXWqA3jvjA0V94GMPJVRc9/oXBQlaKoXPxY+PgYe9qQnmAgmrn3NOTaujfR7SN7mrU
         gbx7rkioWdbZOZRdTBqtqP2la092sbdHqnSFVpiduHifokbALyz9uT6zfRJ9MEb6RYgO
         LhazklJpmP+zvoWu6sdgbUkNsaz3Wt8+EaAffn5QrZ7O5tocQbx55sxqtnzKLbPkaLFb
         aAqg==
X-Forwarded-Encrypted: i=1; AJvYcCWv4xzc0CEuwKSHSPo2E2peBm7xQQcUIPykmFqC7iENcN3kW8P6e7MAv0ov5lsjn18aEezaoXLy+mfG1h7f@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2xKrthnrUTDjXY1nob4B8uaByqIc8cFIO0xfYxghTiwlaTywM
	4aaNBcYfBpDJd/0YhXP6JLH2fF3r0nshcWD8wRibpZZp6E0BSCNRQEF+bxyFaAU=
X-Gm-Gg: ASbGncv1bMa2q6Y2VSpY/qnQ+5f+pWsJ2NRQVQ9ZrHBKqOvGLaffFDS2tlJwxa7dYHI
	p4c66z92jOfd/tGA7bvPDIudHPXMreLhXK3PFMHk5R6VGaiT2QRtirt9M5ouC/Sg02wMLPJHsOY
	vnP/E7RKuoeMImY/0ddPTaDRMLD3hCcHEtsJIlNqBm8J7UE1sN8QbowdPDFeWL0jdytdhJ+3vxH
	GohlSIZaM3kCb/Jslyl27Tm6sbhQ1478kRPjXS02/5+o0kohy8z3xuzIJY6Hl8oPij9lYWS7DNd
	bO97aKA3VAKjlFCfE20K
X-Google-Smtp-Source: AGHT+IErRbIkqhaq1U1Cvw6m/fzTGdjG/w1CKIiyvbxXGaxWJrO6d40PJ1AJLGV8a9Co67aHSnHXNw==
X-Received: by 2002:a17:906:314d:b0:ab7:d179:24a2 with SMTP id a640c23a62f3a-abbf380427cmr92734366b.1.1740030612432;
        Wed, 19 Feb 2025 21:50:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb989d89edsm735442866b.81.2025.02.19.21.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 21:50:11 -0800 (PST)
Date: Thu, 20 Feb 2025 08:50:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Karan Tilak Kumar (kartilak)" <kartilak@cisco.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Sesidhar Baddela (sebaddel)" <sebaddel@cisco.com>,
	"Gian Carlo Boffa (gcboffa)" <gcboffa@cisco.com>,
	"Arulprabhu Ponnusamy (arulponn)" <arulponn@cisco.com>,
	"Arun Easi (aeasi)" <aeasi@cisco.com>
Subject: Re: drivers/scsi/fnic/fdls_disc.c:263
 fdls_schedule_oxid_free_retry_work() warn: inconsistent indenting
Message-ID: <5886f4ff-d6be-4804-8c76-c431946128a5@stanley.mountain>
References: <f1c717cf-63eb-402a-82cc-91c445055b97@stanley.mountain>
 <fd4d8516-5eaa-43b0-9100-2984312930f8@stanley.mountain>
 <SJ0PR11MB58962A4F0B9CFFB9439FF959C3F92@SJ0PR11MB5896.namprd11.prod.outlook.com>
 <SJ0PR11MB5896888C81BFF2EB81E2B533C3C42@SJ0PR11MB5896.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB5896888C81BFF2EB81E2B533C3C42@SJ0PR11MB5896.namprd11.prod.outlook.com>

On Thu, Feb 20, 2025 at 03:10:26AM +0000, Karan Tilak Kumar (kartilak) wrote:
> On Saturday, February 15, 2025 1:03 PM, Karan Tilak Kumar (kartilak) wrote:
> >
> > On Friday, February 14, 2025 7:03 AM, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > > On Fri, Feb 14, 2025 at 05:42:25PM +0300, Dan Carpenter wrote:
> > > >
> > > > I guess we can't call schedule_delayed_work() without holding the
> > > > spin_lock?  It's a strange thing.
> > >
> > > Actually, I see now that we're just dropping the lock to avoid a sleeping
> > > in atomic warning with the GFP_ATOMIC allocation...  I bet you could make
> > > the code under the lock much smaller.  Just the test_and_clear_bit() stuff
> > > basically.
> > >
> > > regards,
> > > dan carpenter
> 
> The window can be further reduced by adding the lock/unlock around the list_add_tail. But this looks good too.
> 

Could you send the patch for this.  I don't know the code that well and
can't test it.

regards,
dan carpenter

