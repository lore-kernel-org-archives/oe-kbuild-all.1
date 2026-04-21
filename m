Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32691F3D56
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776815928; cv=pass; b=mHwcHEt3PKgL5ZghelVnrR7fc6kK5ILEn9RJEDuwqOHkUzzszPr63Tq/4EsguPu9eqvREy6ldRbOwcOKVmri28tFLoLFhShDVWWHyA0iafwDZaOGlZspgF2uqpajwlRV3krzhvhQ5ykqm/AnXnMMKJtweS8yU2Mpzf30whDzKeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776815928; c=relaxed/simple;
	bh=h6st7tUPmacYRbcbyVHk1J1MmG7oibqwV0YNku9qCTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7JhVZ3zymPfzUIkNBc9BJWBYbHs9fMAZw+KeZmOnXeThs18BfTx0tR5yORI1+hp32Dqu3uoAepOaiRUHJbEnmuTXn6yfwBOQUISR8ViaPz6f14QON0Lede8ISJ44UqUJA/kRIAE2Y5MEVCi12aJi0s+vcoBPkjK3XBK8U92YsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hkor9R+Q; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hkor9R+Q"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8a3342d301aso49280346d6.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 16:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776815926; cv=none;
        d=google.com; s=arc-20240605;
        b=DQXl+JQxPAfW8tBQ9qXZv7HRBjezW3U//6nkrzjL6nOideiXr7ptkRVuf50Fvf8GJi
         N1HPvWrUO4XwdjaA1bU10cdgKTuHodpwUOZ0Y8/OLFHRhsC+sDF2e5tJ407rGFg+ubbw
         qqIn3G7tgwRfKYJBgXV5tIZyW6t5haMo94eqhIPEP7/ErYmHuic67CWlbxZnTMxts+aJ
         JqK52yiB8wI2ltcksUva8m9UHWopkHqyX5/7jrD09qPrKW0o2pBULN1PeAifz5yrQNND
         6OmZANpYy96iJs8wIJZYunG7MJxSKWeRY2ytS5Gq1wYX1IN1xX041zwcCEnmeDvbwsxM
         /ZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1w9xmPIw1s4ACofNeSxjnnwGMUxDSVTPAfVJPCJagLY=;
        fh=7xRMlpaa9bdW30QPRyzkdgUsiPe9NjzoNVL5ZcLlpe8=;
        b=T9QtMO/LFNr1nZ8aub9DUwx9Qo1gfdo0FF+pUFO4FHL1RghBQHTyG8weYr2HTABQBU
         pcSfl6od4nKj9tqJZSvv1J3SS4fHEUaV5Lt5/NAPwqE6BMmBIRhBX86AHsxPAmjbLi1v
         nuJSw7b8ToC+PISTVGnbv3TtYI8WZ+BveyCzIOtZfnDJK1wotkwsWyxBRCEwKSevGwDx
         EPS+ljy38/Cp85P7BI4G0HlwT4dw0++TJulibeK5PHRlldcBxrAoFso0qJfe0JoIPZ22
         VLr+1K4gqWUXl7v+CFYrDDTj6j4qqIhnYz9FFaV5An3MeFK77m3NmjTEnvwKOmzQ8/JO
         HaMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776815926; x=1777420726; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1w9xmPIw1s4ACofNeSxjnnwGMUxDSVTPAfVJPCJagLY=;
        b=Hkor9R+QuRpL4WuTUFIeo6GJvthk0hozffrxGTIcmNyD8afj9HtWvgim5GbfgXEIvV
         3V0Pwg8TVTieP4hDsI07ogROy4tEEH4y2n1+l/2qzMft9UEvaXFJZk/H/dYv2fkcQUDc
         2CpvZ/4UkISaaBmJmk6KpR/Zv9FN0ZinZdy8wUQbxvO1y6W14DBMjiH1WZO1PD2GxKkV
         oHI8KKTNVw0ZNCnW9QaZJGG/flkyQocCt33NkY74iEx9pUqWclbNrfauiSrSpgaTGF5T
         CIHrk/ym3FEOXirY7B1dkE7Q50D/v8nUYPLp7Hj75Su3e8SscQmKSqQ4+KIFBBOzV8kY
         0i6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776815926; x=1777420726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1w9xmPIw1s4ACofNeSxjnnwGMUxDSVTPAfVJPCJagLY=;
        b=Xq13x4WwzIjWjsrArxB38IFNqwE2MNNzZ+FIW5uTJ6Y6hLioaCdeADHvrr2UxsLNk7
         Y3sdzF3u+WqLmkpqPydJhu7NrAnI81WC9Z5WSkQHe2+rD+YEJAV3tyHUlOlpOzpjVo49
         DbAU+S7vm9jFHrmP9+mXRs+cxOlYMeEHaQe1sj6de0TzsKlcIQIkyrP/OqmtND00oA6o
         N/vD/pTSu2y/9KtR/rK/zwYnLbxddrDQ7w0VHlDb/s6QvMuSz7C3cF6dkeWeu7s+uhaw
         deiGusRvOfuhnIUnABFbxny4fPGyo5H54AcB+uLqPDSyo1c9ypRTHHMDggSr4Dd9xEhp
         ilMg==
X-Forwarded-Encrypted: i=1; AFNElJ8AJsU5gmxyS2djhKwpE5nJeM4wI6Kdn7VPwy50Psp9tFyI2+tVat0C6cXK+AIjxnZpKSsJwDpWTDIZs+Rr@lists.linux.dev
X-Gm-Message-State: AOJu0YzcCHWh36h9SgK/bIlHBgQi3ap63OGQZEvQEsfVLeURyF9fMB2A
	VABlzv2iVCQYEKtqUwn1dP5YGdS3k14q1PuMmFC3Eumzr+EC1TX6bPt6op8OzaXQ/TXHT9QrjAe
	hWe7gJW5Xs9J975OcTSFT3t6pdHc5Xnw=
X-Gm-Gg: AeBDievaZs1RRaI8POxcwJrXhIEWMz1c6NKyuwAk8I9ZX+5JnhLmVkgc27j/Izxud2F
	i6937ml16QyOi0r97LBvsT9KAGe5eVsHOYFl0fvqqNMhnJdyTnQ8DLRHS7OhFjc94x1W/Pnr9nx
	a3czc4ZkYRWoNNKnEhaPUWOtee4QJO2ynMqYudaUUffeKMKZBiAE9rlkzkSjQ2E1WgoNRbx8rh9
	gvgyiHNn1V5AiqUKrXlCN5Otoqo8AhfqTSzTM1M86NnloLIVGekV57EKsnZoaee88GxaHciIsAw
	9g+mXEAzUBwakH2nZqbkxOmWIV7nWegVRd33cdKr1ER7r67WvXQ9Cm8TohWixu7NN8VEV9aa0e5
	xSFP29OmIu8TJFY4NVyc5VkHGWiIjSPIWrgG8mv4Q0rwYRKpi4C9IqQwBiBGpgQKb/cOY35Cgtg
	==
X-Received: by 2002:a05:6214:5b86:b0:8ac:7d7a:56fb with SMTP id
 6a1803df08f44-8b027ff9ad8mr334820896d6.5.1776815925829; Tue, 21 Apr 2026
 16:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604220046.tGkRxVtS-lkp@intel.com> <20260421234022.4144209-1-michael.bommarito@gmail.com>
In-Reply-To: <20260421234022.4144209-1-michael.bommarito@gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Tue, 21 Apr 2026 18:58:33 -0500
X-Gm-Features: AQROBzCSqxb7UrXES82np52thvNKKuicFFDAsnSczdEkb-GEFf4ev_ygkXuBAAs
Message-ID: <CAH2r5mvZwRW+uuRmwV2skkJf0mD4FDQoZuNPAGxX5mzGaVYK1A@mail.gmail.com>
Subject: Re: [PATCH] smb: client: scope end_of_dacl to CIFS_DEBUG2 use in parse_dacl
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Steve French <sfrench@samba.org>, Steve French <stfrench@microsoft.com>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged into cifs-2.6.git for-next

On Tue, Apr 21, 2026 at 6:40=E2=80=AFPM Michael Bommarito
<michael.bommarito@gmail.com> wrote:
>
> After validate_dacl() was factored out in commit 149822e5541c, the
> local end_of_dacl in parse_dacl() is only read by the dump_ace()
> call under #ifdef CONFIG_CIFS_DEBUG2.  With CIFS_DEBUG2 off the
> variable is assigned but never used, which gcc -W=3D1 flags as
> -Wunused-but-set-variable.
>
> Remove the local and compute the end-of-dacl pointer inline at the
> single call site inside the existing CIFS_DEBUG2 guard.  No
> functional change: when CIFS_DEBUG2 is enabled the argument value
> is identical to what the removed local carried; when CIFS_DEBUG2
> is disabled the code was already dead.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604220046.tGkRxVtS-lkp@i=
ntel.com/
> Fixes: 149822e5541c ("smb: client: validate the whole DACL before rewriti=
ng it in cifsacl")
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> Assisted-by: Claude:claude-opus-4-7
> ---
>  fs/smb/client/cifsacl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/smb/client/cifsacl.c b/fs/smb/client/cifsacl.c
> index 4ec204d2c774..ec5d47779304 100644
> --- a/fs/smb/client/cifsacl.c
> +++ b/fs/smb/client/cifsacl.c
> @@ -836,7 +836,7 @@ static void parse_dacl(struct smb_acl *pdacl, char *e=
nd_of_acl,
>         int i;
>         u16 num_aces =3D 0;
>         int acl_size;
> -       char *acl_base, *end_of_dacl;
> +       char *acl_base;
>         struct smb_ace **ppace;
>
>         /* BB need to add parm so we can store the SID BB */
> @@ -860,7 +860,6 @@ static void parse_dacl(struct smb_acl *pdacl, char *e=
nd_of_acl,
>            user/group/other have no permissions */
>         fattr->cf_mode &=3D ~(0777);
>
> -       end_of_dacl =3D (char *)pdacl + le16_to_cpu(pdacl->size);
>         acl_base =3D (char *)pdacl;
>         acl_size =3D sizeof(struct smb_acl);
>
> @@ -876,7 +875,8 @@ static void parse_dacl(struct smb_acl *pdacl, char *e=
nd_of_acl,
>                         ppace[i] =3D (struct smb_ace *) (acl_base + acl_s=
ize);
>
>  #ifdef CONFIG_CIFS_DEBUG2
> -                       dump_ace(ppace[i], end_of_dacl);
> +                       dump_ace(ppace[i],
> +                                (char *)pdacl + le16_to_cpu(pdacl->size)=
);
>  #endif
>                         if (mode_from_special_sid &&
>                             ppace[i]->sid.num_subauth >=3D 3 &&
> --
> 2.53.0
>
>


--=20
Thanks,

Steve
