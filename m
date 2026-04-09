Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFCB3B530A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775751421; cv=pass; b=oPGsIBm9Fix8UAJNILR7+UDkobuAQyru7jYkvN5hM6paWsZD3l31R6a6nkD8zJYi5JYZyYJNl3th4WRNz9Gvk9UX6K6jJWbGdCtAG8mezF1BV0asb5aBUh9iNkJNnlW3FgP9Ubtkob7kIpSkihnBqKWiayhS8YpYtNCkRUGp77w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775751421; c=relaxed/simple;
	bh=/SNAak0lLDbj0PZAGz5DFlisSXGzEqTuaXlGitl8gi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uusJAph3x07H9/IR//TqQMGZQonLWQ6m4TK/oE6VFHuB4QEWkXOpD9WyKn0zgBawkkFKX27pGMFlIuM9Ab3FVP51vAA/udHJvDcZB8hRpxlZEdseriwQPiRZ4SqNPErurM/pZ34n4TCErln0D0nYcGEbnT5nwG3oOiMGe0RGggU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gdbq5oSw; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gdbq5oSw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9c04152730so179989766b.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Apr 2026 09:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775751418; cv=none;
        d=google.com; s=arc-20240605;
        b=Ez/O93K/+yP0mdlbPM48O3Idr0ySb6sHQYDu5w892BcGeNyJT+q7L/3Hq6d2i1lXf1
         GUYujhoO4xJ2m+wpWGEUQi8toifpN5JTG+e+A2vPvn22D/3fcOwt+CBWokVCNW17Lg9O
         HmWyDirvvHW407CVhLyfn7PREXKd5ieP75brygoaJ9siiaYRvnG9NsizaTNiKBT2PY1O
         yHUoywCZplmBQw0V+LY30TebeKxx4QyuVFjbrY2L7i8sK6nH4yUT6/UJ38S12gu+F+Iz
         Tcz3jGC5HZ9W+nSgQXyUw8JiI2LVOxojEOA8S2SWOLO5XRKqPf3n8iRUGN8lDfL/T+iC
         GJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oQFyfbZpEY5tsQkH/R11s1S7djWon24HiYbDSXiUGk4=;
        fh=OvG2WNobJMPSuKonP+0NkM+expu7JpyxFy2XVYV1smA=;
        b=fPvYjA/ICT5L4ZIWTRpm702S5aB/6n+hMgpLBfXBrluDajBIjUITv4fIdq8+Z4dmcH
         mlHZwYMIXnv77gQq50JDsJSDI1TpAa1HHLnsKQG4f0I82P4PentTf36YypepJHQ4s0EC
         QhVR9073Ns02UrFUwzCDse1fb2NEfuSkY9qWFmguFxYQvGdkEEBx8nPJZK3AFGlyW846
         9BNK7WLtwVQDsSG9DclWAYSkbfuEPTO296gHsU012iIDgN3b0Bux8cMcrvCv0Ho8SiB5
         //DVzElgaGuJzH5huE6tQTJmuTGlQEHY4C42zu2q1GMKE1IER7f/M9FbXB+sr12KOyPb
         HELA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775751418; x=1776356218; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oQFyfbZpEY5tsQkH/R11s1S7djWon24HiYbDSXiUGk4=;
        b=Gdbq5oSw5ZPrsAPvVN9/upMfJe7d711y8K4+HQTxEBGBNrLR0zlU5QcsEOHTys1+qS
         pnYrA/H8EIhGtir5Far6CIRfOOdd7m4Vb7teScSr5LzNswtDQO1lXBLfE2HDp1plnTA6
         PC1YoC14CsS71MWoJXS5bAnGUx6AaDSV10Z0RX63Su1eXPqw/RseUoQXn0Oen84a2pR8
         k0aMsGu4/udxfRlntK/Fs+85QAzG3zmNtPXQ3Y0FMXO2xRzkNhYAUhxlz3D4Ara9URSB
         nH9x6bixIaBOdaazD+0rm/Xa48/Lzorf84Db9Iurix35R4RCMK6xqCl21GorQ0xFtKr6
         UD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775751418; x=1776356218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQFyfbZpEY5tsQkH/R11s1S7djWon24HiYbDSXiUGk4=;
        b=LLb0KabNJhDH+FGMMRJxj+7wAcacCbFLOLGw0fr9Xq7kfakoQc3EuGFhiDkX3JHsvU
         ljRqpedcMI4rCDYujYH/FlBOrOh2Ed5qdmEuV5nN0ljuunY9ieasxu26g+8NKovZOShj
         3hfzwki4pVArIztkYtkm/zN/2mJUb2N9YLVBbKK32gbz3xuKj5DsGFw9/TMvtvYJ8GlA
         hS1THe2G8+K6+/tkfdZ22qvvjZ5sR9SufNeHGkzPpGUmEb6qQjgIhOgws63gQxQkJ3Qu
         GI0JUDFXdSAFm1XKwN5RF+o83SUjeFRuAlKAKS3jsAqap0QP0tpzNzxt3f13JDmctIe0
         CSsg==
X-Forwarded-Encrypted: i=1; AJvYcCWlDUfEk9Piu95HNpoKSdp2kc53xdj+kdmh/9Df1t2xE1geo8wXKMF6hweUr83lp4ys669O2iz4rY1zpEQR@lists.linux.dev
X-Gm-Message-State: AOJu0YymMYAI1MWsHvmGDT86wsG/BT2ziZkBH9PxymAHFNBeSkylTXdn
	n6YGNe3R1E3Dv0/qvKOwBnItLdKSGZgwb/JjqHAveGAulF403aSx+UitIzQ4UIU7/i5PrIEfjlj
	lu4jZbeHEJGGedhtN0zMth1nQRoe/Ik0=
X-Gm-Gg: AeBDietFD5uGesMprkDJXYPN8OjSM3no5BffAqO30A92fG450Sy10ikwW0Me7G7PpYz
	2VC8YQmzXpkMGxWSAg2HFHxxlurIDArn6pivKWq4+vRH11SCImHRGqPNPhoT9vU5cM7/j6HHUq+
	2Qi2xTqjy7R4sc//x/2gMRrqJ0nff18vmwYKV1j1ynW7SPKGmsAQxVQNK91JnUDcCoZg6JF//V/
	xlxu3hM10C7uCwKLDL32kmb9a+ZwDIjeHlCJp7ynSIn+jkwoVNx7kXMgmStsyViUT1J04WYgu/q
	laHT49Y=
X-Received: by 2002:a17:907:961b:b0:b98:4abb:cc49 with SMTP id
 a640c23a62f3a-b9c672d41b7mr1226019066b.5.1775751417925; Thu, 09 Apr 2026
 09:16:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604090741.1kUVXMoc-lkp@intel.com> <CAFnufp29D4VdTgoJ4uDk-dQ4-RuO_C6=TQ7O9TA5M=JSe1j+cw@mail.gmail.com>
 <1c7e8c605d2373c26b08d0eb64cc56efd69dbc26.camel@perches.com>
In-Reply-To: <1c7e8c605d2373c26b08d0eb64cc56efd69dbc26.camel@perches.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Thu, 9 Apr 2026 18:16:20 +0200
X-Gm-Features: AQROBzCo2-VgCldPF46Lb3Hu44BVes7XNsrMjMa5Vs3HM6cSgqwi-R1iHJrqf7c
Message-ID: <CAFnufp0qW40DrZPG5akNaoXanRNN2MBW2ougcwThtzAXh-z5VA@mail.gmail.com>
Subject: Re: [linux-next:master 8662/12838] htmldocs: MAINTAINERS:40: WARNING:
 Inline strong start-string without end-string. [docutils]
To: Joe Perches <joe@perches.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 9 apr 2026 alle ore 16:47 Joe Perches <joe@perches.com>
ha scritto:
>
> On Thu, 2026-04-09 at 12:12 +0200, Matteo Croce wrote:
> > > > > MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
> >
> > >
> > >    Documentation/userspace-api/landlock:480: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.
> > >
> > >
> >
> >
> > The problem is that "**" is seen as start of a bold text in RST.
> > Escaping the first * fixes error and keeps the glob unaffected:
> >
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -35,7 +35,7 @@ Descriptions of section entries and preferred order
> >      F: drivers/net/ all files in and below drivers/net
> >      F: drivers/net/* all files in drivers/net, but not below
> >      F: */net/* all files in "any top level directory"/net
> > -    F: fs/**/*foo*.c all *foo*.c files in any subdirectory of fs
> > +    F: fs/\**/*foo*.c all *foo*.c files in any subdirectory of fs
> >      One pattern per line.  Multiple F: lines acceptable.
> >   X: *Excluded* files and directories that are NOT maintained, same
> >      rules as F:. Files exclusions are tested before file matches.
> >
> > should I create a fix patch or we can still amend the previous in net-next?
>
> nack.
>
> this shouldn't be fixed this way.
> betterwould be to not try to format things that shouldn't be formatted.

what about escaping it here?

--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -89,7 +89,8 @@ class MaintainersInclude(Include):
             output = None
             if descriptions:
                 # Escape the escapes in preformatted text.
-                output = "| %s" % (line.replace("\\", "\\\\"))
+                output = "| %s" % (line.replace("\\", "\\\\")
+                                        .replace("**", "\\**"))
                 # Look for and record field letter to field name mappings:
                 #   R: Designated *reviewer*: FullName <address@domain>
                 m = re.search(r"\s(\S):\s", line)

Regards,
-- 
Matteo Croce

perl -e 'for($t=0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay
