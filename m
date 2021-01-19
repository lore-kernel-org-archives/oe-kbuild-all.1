Content-Type: multipart/mixed; boundary="===============4880536019936882950=="
MIME-Version: 1.0
From: Imre Deak <imre.deak@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH v7 3/3] drm/i915/tgl: Add Clear Color support for TGL Render Decompression
Date: Tue, 19 Jan 2021 16:20:03 +0200
Message-ID: <20210119142003.GB1199567@ideak-desk.fi.intel.com>
In-Reply-To: <20210119082936.GG2696@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4880536019936882950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Tue, Jan 19, 2021 at 11:29:37AM +0300, Dan Carpenter wrote:
> Hi Imre,
> =

> url:    https://github.com/0day-ci/linux/commits/Imre-Deak/drm-i915-gen12=
-Add-display-render-clear-color-decompression-support/20210115-113136
> ...
> d5de4516a9de74 drivers/gpu/drm/i915/display/intel_display.c Radhakrishna =
Sripada 2021-01-14  15296  		 */
> d5de4516a9de74 drivers/gpu/drm/i915/display/intel_display.c Radhakrishna =
Sripada 2021-01-14  15297  		ret =3D i915_gem_object_read_from_page(obj,
> d5de4516a9de74 drivers/gpu/drm/i915/display/intel_display.c Radhakrishna =
Sripada 2021-01-14  15298  						     fb->offsets[2] + 16,
> d5de4516a9de74 drivers/gpu/drm/i915/display/intel_display.c Radhakrishna =
Sripada 2021-01-14 @15299  						     sizeof(&plane_state->ccval),
> d5de4516a9de74 drivers/gpu/drm/i915/display/intel_display.c Radhakrishna =
Sripada 2021-01-14  15300  						     &plane_state->ccval);
> =

> This is a bug in Smatch and it's quite complicated to fix...  But the
> sizeof() is still probably wrong.  It should be the size of the u64
> instead of the address.

Yes, thanks for the note, I typoed the sizeof(). It's fixed in:

https://patchwork.freedesktop.org/patch/414552/?series=3D85877&rev=3D4

--Imre
--===============4880536019936882950==--

