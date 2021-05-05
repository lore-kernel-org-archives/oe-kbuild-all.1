Content-Type: multipart/mixed; boundary="===============2192841927584542097=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8466:13: warning: stack frame size of 2112 bytes in function 'amdgpu_dm_atomic_commit_tail'
Date: Wed, 05 May 2021 11:47:30 +0800
Message-ID: <202105051123.4uHvZ9XN-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2192841927584542097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d665ea6ea86c785760ee4bad4543dab3267ad074
commit: a85ba00538cd4bb0655aaf57fe3ebf8cc21f4fea drm/amdgpu/display: re-ena=
ble freesync video patches
date:   6 weeks ago
config: powerpc-randconfig-r016-20210505 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a2a=
5836cc8e4c1def2bdeb022e7b496623439)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da85ba00538cd4bb0655aaf57fe3ebf8cc21f4fea
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a85ba00538cd4bb0655aaf57fe3ebf8cc21f4fea
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8466:13: war=
ning: stack frame size of 2112 bytes in function 'amdgpu_dm_atomic_commit_t=
ail' [-Wframe-larger-than=3D]
   static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
               ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8054:13: war=
ning: stack frame size of 2352 bytes in function 'amdgpu_dm_commit_planes' =
[-Wframe-larger-than=3D]
   static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
               ^
   2 warnings generated.


vim +/amdgpu_dm_atomic_commit_tail +8466 drivers/gpu/drm/amd/amdgpu/../disp=
lay/amdgpu_dm/amdgpu_dm.c

e7b07ceef2a650 Harry Wentland      2017-08-10  8457  =

b8592b48450b99 Leo Li              2018-09-14  8458  /**
b8592b48450b99 Leo Li              2018-09-14  8459   * amdgpu_dm_atomic_co=
mmit_tail() - AMDgpu DM's commit tail implementation.
b8592b48450b99 Leo Li              2018-09-14  8460   * @state: The atomic =
state to commit
b8592b48450b99 Leo Li              2018-09-14  8461   *
b8592b48450b99 Leo Li              2018-09-14  8462   * This will tell DC t=
o commit the constructed DC state from atomic_check,
b8592b48450b99 Leo Li              2018-09-14  8463   * programming the har=
dware. Any failures here implies a hardware failure, since
b8592b48450b99 Leo Li              2018-09-14  8464   * atomic check should=
 have filtered anything non-kosher.
b8592b48450b99 Leo Li              2018-09-14  8465   */
7578ecda14d521 Alex Deucher        2017-10-10 @8466  static void amdgpu_dm_=
atomic_commit_tail(struct drm_atomic_state *state)
e7b07ceef2a650 Harry Wentland      2017-08-10  8467  {
e7b07ceef2a650 Harry Wentland      2017-08-10  8468  	struct drm_device *de=
v =3D state->dev;
1348969ab68cb8 Luben Tuikov        2020-08-24  8469  	struct amdgpu_device =
*adev =3D drm_to_adev(dev);
e7b07ceef2a650 Harry Wentland      2017-08-10  8470  	struct amdgpu_display=
_manager *dm =3D &adev->dm;
e7b07ceef2a650 Harry Wentland      2017-08-10  8471  	struct dm_atomic_stat=
e *dm_state;
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8472  	struct dc_state *dc_s=
tate =3D NULL, *dc_state_temp =3D NULL;
e7b07ceef2a650 Harry Wentland      2017-08-10  8473  	uint32_t i, j;
5cc6dcbd45a60b Leo (Sunpeng  Li    2017-10-12  8474) 	struct drm_crtc *crtc;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8475) 	struct drm_crtc_state=
 *old_crtc_state, *new_crtc_state;
e7b07ceef2a650 Harry Wentland      2017-08-10  8476  	unsigned long flags;
e7b07ceef2a650 Harry Wentland      2017-08-10  8477  	bool wait_for_vblank =
=3D true;
e7b07ceef2a650 Harry Wentland      2017-08-10  8478  	struct drm_connector =
*connector;
c2cea7063b85fc Leo (Sunpeng  Li    2017-10-12  8479) 	struct drm_connector_=
state *old_con_state, *new_con_state;
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8480) 	struct dm_crtc_state =
*dm_old_crtc_state, *dm_new_crtc_state;
fe2a19652918a5 Lyude Paul          2018-06-21  8481  	int crtc_disable_coun=
t =3D 0;
6ee90e88b97674 hersen wu           2020-07-08  8482  	bool mode_set_reset_r=
equired =3D false;
e7b07ceef2a650 Harry Wentland      2017-08-10  8483  =

e8a982355f9669 Rodrigo Siqueira    2020-09-04  8484  	trace_amdgpu_dm_atomi=
c_commit_tail_begin(state);
e8a982355f9669 Rodrigo Siqueira    2020-09-04  8485  =

e7b07ceef2a650 Harry Wentland      2017-08-10  8486  	drm_atomic_helper_upd=
ate_legacy_modeset_state(dev, state);
e7b07ceef2a650 Harry Wentland      2017-08-10  8487  =

eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8488  	dm_state =3D dm_atomi=
c_get_new_state(state);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8489  	if (dm_state && dm_st=
ate->context) {
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8490  		dc_state =3D dm_stat=
e->context;
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8491  	} else {
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8492  		/* No state changes,=
 retain current state. */
813d20dccf93f8 Aidan Wood          2019-02-22  8493  		dc_state_temp =3D dc=
_create_state(dm->dc);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8494  		ASSERT(dc_state_temp=
);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8495  		dc_state =3D dc_stat=
e_temp;
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8496  		dc_resource_state_co=
py_construct_current(dm->dc, dc_state);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8497  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8498  =

6d90a208cfff94 Aurabindo Pillai    2020-09-11  8499  	for_each_oldnew_crtc_=
in_state (state, crtc, old_crtc_state,
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8500  				       new_crtc_st=
ate, i) {
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8501  		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(crtc);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8502  =

6d90a208cfff94 Aurabindo Pillai    2020-09-11  8503  		dm_old_crtc_state =
=3D to_dm_crtc_state(old_crtc_state);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8504  =

6d90a208cfff94 Aurabindo Pillai    2020-09-11  8505  		if (old_crtc_state->=
active &&
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8506  		    (!new_crtc_state=
->active ||
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8507  		     drm_atomic_crtc=
_needs_modeset(new_crtc_state))) {
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8508  			manage_dm_interrupt=
s(adev, acrtc, false);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8509  			dc_stream_release(d=
m_old_crtc_state->stream);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8510  		}
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8511  	}
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8512  =

8976f73b676eb9 Rodrigo Siqueira    2020-11-17  8513  	drm_atomic_helper_cal=
c_timestamping_constants(state);
8976f73b676eb9 Rodrigo Siqueira    2020-11-17  8514  =

e7b07ceef2a650 Harry Wentland      2017-08-10  8515  	/* update changed ite=
ms */
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8516) 	for_each_oldnew_crtc_=
in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8517  		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(crtc);
b830ebc910f641 Harry Wentland      2017-07-26  8518  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8519) 		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8520) 		dm_old_crtc_state =
=3D to_dm_crtc_state(old_crtc_state);
e7b07ceef2a650 Harry Wentland      2017-08-10  8521  =

f1ad2f5efd29dc Harry Wentland      2017-09-12  8522  		DRM_DEBUG_DRIVER(
e7b07ceef2a650 Harry Wentland      2017-08-10  8523  			"amdgpu_crtc id:%d =
crtc_state_flags: enable:%d, active:%d, "
e7b07ceef2a650 Harry Wentland      2017-08-10  8524  			"planes_changed:%d,=
 mode_changed:%d,active_changed:%d,"
e7b07ceef2a650 Harry Wentland      2017-08-10  8525  			"connectors_changed=
:%d\n",
e7b07ceef2a650 Harry Wentland      2017-08-10  8526  			acrtc->crtc_id,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8527) 			new_crtc_state->ena=
ble,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8528) 			new_crtc_state->act=
ive,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8529) 			new_crtc_state->pla=
nes_changed,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8530) 			new_crtc_state->mod=
e_changed,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8531) 			new_crtc_state->act=
ive_changed,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8532) 			new_crtc_state->con=
nectors_changed);
e7b07ceef2a650 Harry Wentland      2017-08-10  8533  =

5c68c65295de0b Victor Lu           2020-10-23  8534  		/* Disable cursor if=
 disabling crtc */
5c68c65295de0b Victor Lu           2020-10-23  8535  		if (old_crtc_state->=
active && !new_crtc_state->active) {
5c68c65295de0b Victor Lu           2020-10-23  8536  			struct dc_cursor_po=
sition position;
5c68c65295de0b Victor Lu           2020-10-23  8537  =

5c68c65295de0b Victor Lu           2020-10-23  8538  			memset(&position, 0=
, sizeof(position));
5c68c65295de0b Victor Lu           2020-10-23  8539  			mutex_lock(&dm->dc_=
lock);
5c68c65295de0b Victor Lu           2020-10-23  8540  			dc_stream_set_curso=
r_position(dm_old_crtc_state->stream, &position);
5c68c65295de0b Victor Lu           2020-10-23  8541  			mutex_unlock(&dm->d=
c_lock);
5c68c65295de0b Victor Lu           2020-10-23  8542  		}
5c68c65295de0b Victor Lu           2020-10-23  8543  =

27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8544) 		/* Copy all transien=
t state flags into dc state */
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8545) 		if (dm_new_crtc_stat=
e->stream) {
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8546) 			amdgpu_dm_crtc_copy=
_transient_flags(&dm_new_crtc_state->base,
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8547) 							    dm_new_crtc=
_state->stream);
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8548) 		}
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8549) =

e7b07ceef2a650 Harry Wentland      2017-08-10  8550  		/* handles headless =
hotplug case, updating new_state and
e7b07ceef2a650 Harry Wentland      2017-08-10  8551  		 * aconnector as nee=
ded
e7b07ceef2a650 Harry Wentland      2017-08-10  8552  		 */
e7b07ceef2a650 Harry Wentland      2017-08-10  8553  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8554) 		if (modeset_required=
(new_crtc_state, dm_new_crtc_state->stream, dm_old_crtc_state->stream)) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8555  =

f1ad2f5efd29dc Harry Wentland      2017-09-12  8556  			DRM_DEBUG_DRIVER("A=
tomic commit: SET crtc id %d: [%p]\n", acrtc->crtc_id, acrtc);
e7b07ceef2a650 Harry Wentland      2017-08-10  8557  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8558) 			if (!dm_new_crtc_st=
ate->stream) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8559  				/*
e7b07ceef2a650 Harry Wentland      2017-08-10  8560  				 * this could happ=
en because of issues with
e7b07ceef2a650 Harry Wentland      2017-08-10  8561  				 * userspace notif=
ications delivery.
e7b07ceef2a650 Harry Wentland      2017-08-10  8562  				 * In this case us=
erspace tries to set mode on
1f6010a96273c3 David Francis       2018-08-15  8563  				 * display which i=
s disconnected in fact.
1f6010a96273c3 David Francis       2018-08-15  8564  				 * dc_sink is NULL=
 in this case on aconnector.
e7b07ceef2a650 Harry Wentland      2017-08-10  8565  				 * We expect reset=
 mode will come soon.
e7b07ceef2a650 Harry Wentland      2017-08-10  8566  				 *
e7b07ceef2a650 Harry Wentland      2017-08-10  8567  				 * This can also h=
appen when unplug is done
e7b07ceef2a650 Harry Wentland      2017-08-10  8568  				 * during resume s=
equence ended
e7b07ceef2a650 Harry Wentland      2017-08-10  8569  				 *
e7b07ceef2a650 Harry Wentland      2017-08-10  8570  				 * In this case, w=
e want to pretend we still
e7b07ceef2a650 Harry Wentland      2017-08-10  8571  				 * have a sink to =
keep the pipe running so that
e7b07ceef2a650 Harry Wentland      2017-08-10  8572  				 * hw state is con=
sistent with the sw state
e7b07ceef2a650 Harry Wentland      2017-08-10  8573  				 */
f1ad2f5efd29dc Harry Wentland      2017-09-12  8574  				DRM_DEBUG_DRIVER("=
%s: Failed to create new stream for crtc %d\n",
e7b07ceef2a650 Harry Wentland      2017-08-10  8575  						__func__, acrtc-=
>base.base.id);
e7b07ceef2a650 Harry Wentland      2017-08-10  8576  				continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8577  			}
e7b07ceef2a650 Harry Wentland      2017-08-10  8578  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8579) 			if (dm_old_crtc_sta=
te->stream)
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8580) 				remove_stream(adev=
, acrtc, dm_old_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8581  =

97028037a38ae4 Lyude Paul          2018-06-04  8582  			pm_runtime_get_nore=
sume(dev->dev);
97028037a38ae4 Lyude Paul          2018-06-04  8583  =

e7b07ceef2a650 Harry Wentland      2017-08-10  8584  			acrtc->enabled =3D =
true;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8585) 			acrtc->hw_mode =3D =
new_crtc_state->mode;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8586) 			crtc->hwmode =3D ne=
w_crtc_state->mode;
6ee90e88b97674 hersen wu           2020-07-08  8587  			mode_set_reset_requ=
ired =3D true;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8588) 		} else if (modereset=
_required(new_crtc_state)) {
f1ad2f5efd29dc Harry Wentland      2017-09-12  8589  			DRM_DEBUG_DRIVER("A=
tomic commit: RESET. crtc id %d:[%p]\n", acrtc->crtc_id, acrtc);
e7b07ceef2a650 Harry Wentland      2017-08-10  8590  			/* i.e. reset mode =
*/
6ee90e88b97674 hersen wu           2020-07-08  8591  			if (dm_old_crtc_sta=
te->stream)
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8592) 				remove_stream(adev=
, acrtc, dm_old_crtc_state->stream);
a85ba00538cd4b Nikola Cornij       2021-03-15  8593  =

6ee90e88b97674 hersen wu           2020-07-08  8594  			mode_set_reset_requ=
ired =3D true;
8c322309e48e9f Roman Li            2019-09-20  8595  		}
e7b07ceef2a650 Harry Wentland      2017-08-10  8596  	} /* for_each_crtc_in=
_state() */
e7b07ceef2a650 Harry Wentland      2017-08-10  8597  =

eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8598  	if (dc_state) {
6ee90e88b97674 hersen wu           2020-07-08  8599  		/* if there mode set=
 or reset, disable eDP PSR */
6ee90e88b97674 hersen wu           2020-07-08  8600  		if (mode_set_reset_r=
equired)
6ee90e88b97674 hersen wu           2020-07-08  8601  			amdgpu_dm_psr_disab=
le_all(dm);
6ee90e88b97674 hersen wu           2020-07-08  8602  =

eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8603  		dm_enable_per_frame_=
crtc_master_sync(dc_state);
674e78acae0dfb Nicholas Kazlauskas 2018-12-05  8604  		mutex_lock(&dm->dc_l=
ock);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8605  		WARN_ON(!dc_commit_s=
tate(dm->dc, dc_state));
674e78acae0dfb Nicholas Kazlauskas 2018-12-05  8606  		mutex_unlock(&dm->dc=
_lock);
fa2123dbccdc88 Mikita Lipski       2017-10-17  8607  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8608  =

0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8609) 	for_each_new_crtc_in_=
state(state, crtc, new_crtc_state, i) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8610  		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(crtc);
b830ebc910f641 Harry Wentland      2017-07-26  8611  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8612) 		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
e7b07ceef2a650 Harry Wentland      2017-08-10  8613  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8614) 		if (dm_new_crtc_stat=
e->stream !=3D NULL) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8615  			const struct dc_str=
eam_status *status =3D
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8616) 					dc_stream_get_sta=
tus(dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8617  =

eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8618  			if (!status)
09f609c34fc8b9 Leo Li              2018-11-27  8619  				status =3D dc_stre=
am_get_status_from_state(dc_state,
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8620  									 dm_new_crtc_=
state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8621  			if (!status)
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8622) 				DC_ERR("got no sta=
tus for stream %p on acrtc%p\n", dm_new_crtc_state->stream, acrtc);
e7b07ceef2a650 Harry Wentland      2017-08-10  8623  			else
e7b07ceef2a650 Harry Wentland      2017-08-10  8624  				acrtc->otg_inst =
=3D status->primary_otg_inst;
e7b07ceef2a650 Harry Wentland      2017-08-10  8625  		}
e7b07ceef2a650 Harry Wentland      2017-08-10  8626  	}
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8627  #ifdef CONFIG_DRM_AMD_=
DC_HDCP
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8628  	for_each_oldnew_conne=
ctor_in_state(state, connector, old_con_state, new_con_state, i) {
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8629  		struct dm_connector_=
state *dm_new_con_state =3D to_dm_connector_state(new_con_state);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8630  		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(dm_new_con_state->base.crtc);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8631  		struct amdgpu_dm_con=
nector *aconnector =3D to_amdgpu_dm_connector(connector);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8632  =

0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8633  		new_crtc_state =3D N=
ULL;
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8634  =

0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8635  		if (acrtc)
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8636  			new_crtc_state =3D =
drm_atomic_get_new_crtc_state(state, &acrtc->base);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8637  =

0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8638  		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8639  =

0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8640  		if (dm_new_crtc_stat=
e && dm_new_crtc_state->stream =3D=3D NULL &&
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8641  		    connector->state=
->content_protection =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8642  			hdcp_reset_display(=
adev->dm.hdcp_workqueue, aconnector->dc_link->link_index);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8643  			new_con_state->cont=
ent_protection =3D DRM_MODE_CONTENT_PROTECTION_DESIRED;
97f6c91787d9fc Bhawanpreet Lakha   2019-09-26  8644  			dm_new_con_state->u=
pdate_hdcp =3D true;
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8645  			continue;
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8646  		}
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8647  =

0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8648  		if (is_content_prote=
ction_different(new_con_state, old_con_state, connector, adev->dm.hdcp_work=
queue))
b1abe5586ffcb1 Bhawanpreet Lakha   2019-08-28  8649  			hdcp_update_display(
b1abe5586ffcb1 Bhawanpreet Lakha   2019-08-28  8650  				adev->dm.hdcp_work=
queue, aconnector->dc_link->link_index, aconnector,
23eb41917fc9f2 Bhawanpreet Lakha   2019-08-29  8651  				new_con_state->hdc=
p_content_type,
0e86d3d4fc5233 Yang Li             2021-02-18  8652  				new_con_state->con=
tent_protection =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8653  	}
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8654  #endif
e7b07ceef2a650 Harry Wentland      2017-08-10  8655  =

02d6a6fcdf68c4 David Francis       2018-12-18  8656  	/* Handle connector s=
tate changes */
c2cea7063b85fc Leo (Sunpeng  Li    2017-10-12  8657) 	for_each_oldnew_conne=
ctor_in_state(state, connector, old_con_state, new_con_state, i) {
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8658) 		struct dm_connector_=
state *dm_new_con_state =3D to_dm_connector_state(new_con_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8659) 		struct dm_connector_=
state *dm_old_con_state =3D to_dm_connector_state(old_con_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8660) 		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(dm_new_con_state->base.crtc);
263a4febd1cce6 Anson Jacob         2021-02-18  8661  		struct dc_surface_up=
date dummy_updates[MAX_SURFACES];
19afd79951e630 Nathan Chancellor   2019-02-01  8662  		struct dc_stream_upd=
ate stream_update;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8663  		struct dc_info_packe=
t hdr_packet;
e7b07ceef2a650 Harry Wentland      2017-08-10  8664  		struct dc_stream_sta=
tus *status =3D NULL;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8665  		bool abm_changed, hd=
r_changed, scaling_changed;
e7b07ceef2a650 Harry Wentland      2017-08-10  8666  =

263a4febd1cce6 Anson Jacob         2021-02-18  8667  		memset(&dummy_update=
s, 0, sizeof(dummy_updates));
19afd79951e630 Nathan Chancellor   2019-02-01  8668  		memset(&stream_updat=
e, 0, sizeof(stream_update));
19afd79951e630 Nathan Chancellor   2019-02-01  8669  =

44d09c6a577c8e Harry Wentland      2018-03-15  8670  		if (acrtc) {
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8671) 			new_crtc_state =3D =
drm_atomic_get_new_crtc_state(state, &acrtc->base);
44d09c6a577c8e Harry Wentland      2018-03-15  8672  			old_crtc_state =3D =
drm_atomic_get_old_crtc_state(state, &acrtc->base);
44d09c6a577c8e Harry Wentland      2018-03-15  8673  		}
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8674) =

e7b07ceef2a650 Harry Wentland      2017-08-10  8675  		/* Skip any modesets=
/resets */
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8676) 		if (!acrtc || drm_at=
omic_crtc_needs_modeset(new_crtc_state))
e7b07ceef2a650 Harry Wentland      2017-08-10  8677  			continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8678  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8679) 		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
c1ee92f94ce3b9 David Francis       2018-11-26  8680  		dm_old_crtc_state =
=3D to_dm_crtc_state(old_crtc_state);
c1ee92f94ce3b9 David Francis       2018-11-26  8681  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8682  		scaling_changed =3D =
is_scaling_state_different(dm_new_con_state,
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8683  							     dm_old_con=
_state);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8684  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8685  		abm_changed =3D dm_n=
ew_crtc_state->abm_level !=3D
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8686  			      dm_old_crtc_s=
tate->abm_level;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8687  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8688  		hdr_changed =3D
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8689  			is_hdr_metadata_dif=
ferent(old_con_state, new_con_state);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8690  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8691  		if (!scaling_changed=
 && !abm_changed && !hdr_changed)
c1ee92f94ce3b9 David Francis       2018-11-26  8692  			continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8693  =

b6e881c947417e Dmytro Laktyushkin  2019-09-13  8694  		stream_update.stream=
 =3D dm_new_crtc_state->stream;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8695  		if (scaling_changed)=
 {
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8696) 			update_stream_scali=
ng_settings(&dm_new_con_state->base.crtc->mode,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  8697  					dm_new_con_state,=
 dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8698  =

02d6a6fcdf68c4 David Francis       2018-12-18  8699  			stream_update.src =
=3D dm_new_crtc_state->stream->src;
02d6a6fcdf68c4 David Francis       2018-12-18  8700  			stream_update.dst =
=3D dm_new_crtc_state->stream->dst;
02d6a6fcdf68c4 David Francis       2018-12-18  8701  		}
02d6a6fcdf68c4 David Francis       2018-12-18  8702  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8703  		if (abm_changed) {
02d6a6fcdf68c4 David Francis       2018-12-18  8704  			dm_new_crtc_state->=
stream->abm_level =3D dm_new_crtc_state->abm_level;
02d6a6fcdf68c4 David Francis       2018-12-18  8705  =

02d6a6fcdf68c4 David Francis       2018-12-18  8706  			stream_update.abm_l=
evel =3D &dm_new_crtc_state->abm_level;
02d6a6fcdf68c4 David Francis       2018-12-18  8707  		}
70e8ffc55b98f3 Harry Wentland      2017-11-10  8708  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8709  		if (hdr_changed) {
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8710  			fill_hdr_info_packe=
t(new_con_state, &hdr_packet);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8711  			stream_update.hdr_s=
tatic_metadata =3D &hdr_packet;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8712  		}
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8713  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8714) 		status =3D dc_stream=
_get_status(dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8715  		WARN_ON(!status);
3be5262e353b8a Harry Wentland      2017-07-27  8716  		WARN_ON(!status->pla=
ne_count);
e7b07ceef2a650 Harry Wentland      2017-08-10  8717  =

02d6a6fcdf68c4 David Francis       2018-12-18  8718  		/*
02d6a6fcdf68c4 David Francis       2018-12-18  8719  		 * TODO: DC refuses =
to perform stream updates without a dc_surface_update.
02d6a6fcdf68c4 David Francis       2018-12-18  8720  		 * Here we create an=
 empty update on each plane.
02d6a6fcdf68c4 David Francis       2018-12-18  8721  		 * To fix this, DC s=
hould permit updating only stream properties.
02d6a6fcdf68c4 David Francis       2018-12-18  8722  		 */
02d6a6fcdf68c4 David Francis       2018-12-18  8723  		for (j =3D 0; j < st=
atus->plane_count; j++)
263a4febd1cce6 Anson Jacob         2021-02-18  8724  			dummy_updates[j].su=
rface =3D status->plane_states[0];
98e6436d3af5fe Anthony Koo         2018-08-21  8725  =

02d6a6fcdf68c4 David Francis       2018-12-18  8726  =

02d6a6fcdf68c4 David Francis       2018-12-18  8727  		mutex_lock(&dm->dc_l=
ock);
02d6a6fcdf68c4 David Francis       2018-12-18  8728  		dc_commit_updates_fo=
r_stream(dm->dc,
263a4febd1cce6 Anson Jacob         2021-02-18  8729  						     dummy_updat=
es,
3be5262e353b8a Harry Wentland      2017-07-27  8730  						     status->pla=
ne_count,
02d6a6fcdf68c4 David Francis       2018-12-18  8731  						     dm_new_crtc=
_state->stream,
263a4febd1cce6 Anson Jacob         2021-02-18  8732  						     &stream_upd=
ate,
263a4febd1cce6 Anson Jacob         2021-02-18  8733  						     dc_state);
02d6a6fcdf68c4 David Francis       2018-12-18  8734  		mutex_unlock(&dm->dc=
_lock);
e7b07ceef2a650 Harry Wentland      2017-08-10  8735  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8736  =

b5e83f6fe1f003 Nicholas Kazlauskas 2019-04-08  8737  	/* Count number of ne=
wly disabled CRTCs for dropping PM refs later. */
e1fc2dca1295c4 Leo (Sunpeng  Li    2017-10-18  8738) 	for_each_oldnew_crtc_=
in_state(state, crtc, old_crtc_state,
e1fc2dca1295c4 Leo (Sunpeng  Li    2017-10-18  8739) 				      new_crtc_sta=
te, i) {
fe2a19652918a5 Lyude Paul          2018-06-21  8740  		if (old_crtc_state->=
active && !new_crtc_state->active)
fe2a19652918a5 Lyude Paul          2018-06-21  8741  			crtc_disable_count+=
+;
fe2a19652918a5 Lyude Paul          2018-06-21  8742  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8743) 		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
e1fc2dca1295c4 Leo (Sunpeng  Li    2017-10-18  8744) 		dm_old_crtc_state =
=3D to_dm_crtc_state(old_crtc_state);
66b0c973d7f74e Mario Kleiner       2019-03-29  8745  =

585d450c76d1d5 Aurabindo Pillai    2020-08-12  8746  		/* For freesync conf=
ig update on crtc state and params for irq */
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8747  		update_stream_irq_pa=
rameters(dm, dm_new_crtc_state);
057be086603feb Nicholas Kazlauskas 2019-04-15  8748  =

66b0c973d7f74e Mario Kleiner       2019-03-29  8749  		/* Handle vrr on->of=
f / off->on transitions */
66b0c973d7f74e Mario Kleiner       2019-03-29  8750  		amdgpu_dm_handle_vrr=
_transition(dm_old_crtc_state,
66b0c973d7f74e Mario Kleiner       2019-03-29  8751  						dm_new_crtc_stat=
e);
e7b07ceef2a650 Harry Wentland      2017-08-10  8752  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8753  =

8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8754  	/**
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8755  	 * Enable interrupts =
for CRTCs that are newly enabled or went through
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8756  	 * a modeset. It was =
intentionally deferred until after the front end
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8757  	 * state was modified=
 to wait until the OTG was on and so the IRQ
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8758  	 * handlers didn't ac=
cess stale or invalid state.
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8759  	 */
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8760  	for_each_oldnew_crtc_=
in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8761  		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(crtc);
8e7b6fee9b03d6 Wayne Lin           2021-02-09  8762  #ifdef CONFIG_DEBUG_FS
86bc221918925a Wayne Lin           2021-03-02  8763  		bool configure_crc =
=3D false;
8e7b6fee9b03d6 Wayne Lin           2021-02-09  8764  		enum amdgpu_dm_pipe_=
crc_source cur_crc_src;
8e7b6fee9b03d6 Wayne Lin           2021-02-09  8765  #endif
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8766  		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8767  =

8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8768  		if (new_crtc_state->=
active &&
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8769  		    (!old_crtc_state=
->active ||
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8770  		     drm_atomic_crtc=
_needs_modeset(new_crtc_state))) {
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8771  			dc_stream_retain(dm=
_new_crtc_state->stream);
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8772  			acrtc->dm_irq_param=
s.stream =3D dm_new_crtc_state->stream;
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8773  			manage_dm_interrupt=
s(adev, acrtc, true);
e2881d6d0a2653 Rodrigo Siqueira    2021-01-07  8774  =


:::::: The code at line 8466 was first introduced by commit
:::::: 7578ecda14d521f39e74166103270c62b15af96d drm/amd/display: make a bun=
ch of stuff in amdgpu_dm.c static

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2192841927584542097==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CqJptUPK/wDrouegpUUBAA==
--===============2192841927584542097==--

