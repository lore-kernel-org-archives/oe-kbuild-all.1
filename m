Content-Type: multipart/mixed; boundary="===============6846907189349498621=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC v2 1/1] drm/i915/display: New Property Creation for HDMI
Date: Sat, 08 May 2021 10:03:58 +0300
Message-ID: <202105080003.vWnas9Ok-lkp@intel.com>
In-Reply-To: <20210507065044.23465-2-nischal.varide@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6846907189349498621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Nischal,

url:    https://github.com/0day-ci/linux/commits/Nischal-Varide/drm-i915-di=
splay-New-Property-Creation-for-HDMI/20210507-214441
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-m001-20210507 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/display/intel_hdmi.c:783 intel_hdmi_compute_spd_infofr=
ame() error: uninitialized symbol 'ret'.

vim +/ret +783 drivers/gpu/drm/i915/display/intel_hdmi.c

fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  757  static bool
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  758  intel_hdmi_compute_spd_infoframe(struct intel_en=
coder *encoder,
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  759  				 struct intel_crtc_state *crtc_state,
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  760  				 struct drm_connector_state *conn_state)
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes     2=
011-08-03  761  {
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  762  	struct hdmi_spd_infoframe *frame =3D &crtc_stat=
e->infoframes.spd.spd;
5adaea799c1c2c drivers/gpu/drm/i915/intel_hdmi.c         Damien Lespiau   2=
013-08-06  763  	int ret;
c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  764  	struct hdmi_vendor_product_info *hdmi_vp_info;
c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  765  	struct intel_digital_connector_state *intel_conn_state =3D
c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  766  		to_intel_digital_connector_state(conn_state);
5adaea799c1c2c drivers/gpu/drm/i915/intel_hdmi.c         Damien Lespiau   2=
013-08-06  767  =

fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  768  	if (!crtc_state->has_infoframe)
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  769  		return true;
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes     2=
011-08-03  770  =

fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  771  	crtc_state->infoframes.enable |=3D
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  772  		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYP=
E_SPD);
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes     2=
011-08-03  773  =

c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  774  	if (!intel_conn_state->hdmi_vendor_product_blob) {
c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  775  		ret =3D hdmi_spd_infoframe_init(frame, "intel", "Integrat=
ed gfx");
c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  776  	} else {
c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  777  		if (intel_conn_state->hdmi_vendor_product_blob->data) {
c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  778  			hdmi_vp_info =3D intel_conn_state->hdmi_vendor_product_b=
lob->data;
c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  779  			ret =3D hdmi_spd_infoframe_init(frame, hdmi_vp_info->ven=
dor,
c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  780  					hdmi_vp_info->product);
c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  781  		}

"ret" not initialized on else path if ->data is NULL.

c65cd855971d63 drivers/gpu/drm/i915/display/intel_hdmi.c Nischal Varide   2=
021-05-07  782  	}
3a47ae201e0749 drivers/gpu/drm/i915/display/intel_hdmi.c Pankaj Bharadiya 2=
020-01-15 @783  	if (drm_WARN_ON(encoder->base.dev, ret))
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  784  		return false;
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  785  =

fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  786  	frame->sdi =3D HDMI_SPD_SDI_PC;
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  787  =

fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  788  	ret =3D hdmi_spd_infoframe_check(frame);
3a47ae201e0749 drivers/gpu/drm/i915/display/intel_hdmi.c Pankaj Bharadiya 2=
020-01-15  789  	if (drm_WARN_ON(encoder->base.dev, ret))
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  790  		return false;
fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  791  =

fbf08556ed4344 drivers/gpu/drm/i915/intel_hdmi.c         Ville Syrj=C3=A4l=
=C3=A4    2019-02-25  792  	return true;
c0864cb39c6869 drivers/gpu/drm/i915/intel_hdmi.c         Jesse Barnes     2=
011-08-03  793  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6846907189349498621==--

